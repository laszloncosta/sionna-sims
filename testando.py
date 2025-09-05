
import os
# Suprime as mensagens de Nível 1 (INFO) e Nível 2 (WARNING)
# 0 = mostra tudo; 1 = filtra INFO; 2 = filtra INFO e WARNING; 3 = filtra tudo
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

import tensorflow as tf

gpus = tf.config.list_physical_devices('GPU')

if gpus:
    try:
        # Imprime uma mensagem amigável e os detalhes dos dispositivos
        print(f"GPUs disponíveis: {gpus}")
        for gpu in gpus:
            print(f"- {gpu.name}, Tipo: {gpu.device_type}")
    except RuntimeError as e:
        print(e)
else:
    print("Nenhuma GPU foi detectada pelo TensorFlow.")

print(f"\nTensorFlow versão: {tf.__version__}")
