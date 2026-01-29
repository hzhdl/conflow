from Crypto.Random import random
from Crypto.Util.number import getRandomRange, long_to_bytes, bytes_to_long
from Crypto.Hash import SHA256
from decimal import Decimal

# KZG setup
def kzg_setup(degree):
    # Randomly generate polynomial coefficients
    coeffs = [getRandomRange(0, 2**256) for _ in range(degree + 1)]
    # Choose a random point as the generator
    g = getRandomRange(0, 2**256)
    # Compute the polynomial evaluations at g^1, g^2, ..., g^(degree+1)
    values = [0] * (degree + 1)
    for i in range(1, degree + 2):
        values[i-1] = poly_eval(coeffs, pow(g, i))
    return coeffs, g, values
#   coeffs,degree个点的随机数，可以确定一个多项式的系数
# g 随机数，计算各个项系数
# values   fx在各个点上的value

# KZG commit
def kzg_commit(coeffs, g, point):
    # Compute the polynomial evaluation at the given point
    value = poly_eval(coeffs, point)
    # Generate a random blinding factor
    r = getRandomRange(0, 2**256)
    # Compute the commitment as (g^value * h^r) % p
    h = pow(g, SHA256.new(long_to_bytes(r)).digest())
    commitment = (pow(g, value) * h) % p
    return commitment, r

# KZG verify
def kzg_verify(commitment, g, values, point, value):
    # Verify that the commitment is of the form (g^value * h^r) % p
    h = pow(g, SHA256.new(long_to_bytes(r)).digest())
    expected_commitment = (pow(g, value) * h) % p
    if commitment != expected_commitment:
        return False
    # Verify that the polynomial evaluation at the given point matches the given value
    expected_value = poly_eval(values, point)
    if value != expected_value:
        return False
    return True

# Polynomial evaluation   fx
def poly_eval(coeffs, point):
    result = 0
    for coeff in reversed(coeffs):
        result = result * point + coeff
    return result % p

# Test KZG commitment scheme
p = 2**256 - 2**32 - 977

coeffs, g, values = kzg_setup(10)
point = getRandomRange(0, 2**256)
value = poly_eval(coeffs, point)

commitment, r = kzg_commit(coeffs, g, point)
assert kzg_verify(commitment, g, values, point, value)

print("KZG commitment scheme test passed")
