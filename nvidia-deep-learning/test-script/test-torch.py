#!/usr/bin/env python
# coding: utf-8

import torch.nn as nn
import numpy as np
X = np.arange(0,6).reshape((2, 3))
Y = np.arange(2).reshape((2, 1))


import torch
class Model(nn.Module):
    def __init__(self):
        super().__init__()
        self.den = nn.Linear(3, 1)
    def forward(self, X):
        return den(X)
model = Model()
mse = torch.nn.MSELoss()
sgd = torch.optim.SGD(model.parameters(), 1e-3)


model.zero_grad()
Y_hat = model(torch.Tensor(X))
loss = mse(Y_hat, torch.Tensor(Y))
loss.backward()
sgd.step()
