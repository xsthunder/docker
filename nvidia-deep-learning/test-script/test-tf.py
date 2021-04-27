from tensorflow.keras import Model
from tensorflow.keras.layers import Dense, Input
import tensorflow
inp = Input((3,))
den = Dense(1)
model = Model(inputs=inp, outputs=den(inp), name="test_model")
import numpy as np
X = np.arange(0,6).reshape((2, 3))
Y = np.arange(2).reshape((2, ))
model.compile(
    loss='mse',
    optimizer='sgd',
)
model.fit(X, Y,  epochs=1, batch_size=2)
# CUDA_VISIBLE_DEVICES