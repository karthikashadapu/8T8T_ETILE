#!/bin/bash
# ==================================================
# auto_regen_ips.sh
# Regenerate Intel Quartus IPs with automatic synth/sim selection
# ==================================================

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <fpga_root_path>"
    exit 1
fi

FPGA_ROOT="$1"
IP_ROOT="$FPGA_ROOT/src/ip"

echo "[INFO] Scanning IPs in $IP_ROOT ..."

# --- Force Quartus 24.1 + Questa 23.1 ---
export QUARTUS_INSTALL_DIR="/home/lena/intelFPGA_pro/24.1/quartus"
export PATH="$QUARTUS_INSTALL_DIR/bin:/home/lena/intelFPGA_pro/24.1/qsys/bin:$PATH"

export QUESTA_HOME="/home/lena/intelFPGA_pro/23.1/questa_fe"
export PATH="$QUESTA_HOME/bin:$PATH"

export MTI_DEFAULT_FLAGS="+protectenable +secureip"
export LM_LICENSE_FILE=28500@192.168.130.25
export MGLS_LICENSE_FILE=1717@14.139.1.126:1717@c2s.cdacb.in

QUARTUS_SH="$QUARTUS_INSTALL_DIR/bin/quartus_sh"

# --- Function to sanitize .qip files ---
sanitize_qip() {
    local qipfile="$1"
    # Remove illegal OCS_IP_FILE assignments
    sed -i '/OCS_IP_FILE/d' "$qipfile"
}

# --- Iterate over all IP folders ---
find "$IP_ROOT" -mindepth 1 -maxdepth 2 -type f -name "*.qip" | while read qip; do
    IP_DIR=$(dirname "$qip")
    IP_NAME=$(basename "$IP_DIR")
    echo "[INFO] Processing IP: $IP_NAME"

    # Sanitize the .qip
    sanitize_qip "$qip"

    # Detect if IP has simulation support
    if grep -q "SIMULATION_FILE" "$qip"; then
        GEN_MODE="synth+sim"
        TCL_MODE="ALL"
    else
        GEN_MODE="synth-only"
        TCL_MODE="SYNTH"
    fi

    echo "[INFO] Generating IP: $IP_NAME -> $GEN_MODE"

    TMP_TCL=$(mktemp /tmp/gen_ip_${IP_NAME}_XXXX.tcl)
    cat > "$TMP_TCL" <<EOF
package require ::quartus::qip
project_open "$FPGA_ROOT/qsys_proj.qpf"
ip_generate $TCL_MODE [file normalize "$qip"]
project_close
EOF

    # Run Quartus shell
    $QUARTUS_SH -t "$TMP_TCL" -q || {
        echo "[ERROR] Failed to generate IP: $IP_NAME"
    }

    rm -f "$TMP_TCL"
done

echo "[INFO] IP regeneration complete."

