#!/bin/bash

SCRIPT_DIR=$(dirname $0)
export PYTHONPATH=$SCRIPT_DIR/../../src:$PYTHONPATH

export HF_DATASETS_TRUST_REMOTE_CODE=True
export FSDP_CPU_RAM_EFFICIENT_LOADING=1

python3 $SCRIPT_DIR/finetuning.py \
    --use_peft \
    --peft_method lora \
    --quantization 8bit \
    --model_name ~/mlos/third-party/bench-nn/opt/Meta-Llama-3-8B \
    --output_dir $SCRIPT_DIR/output/ \
    --context_length 512 "$@"