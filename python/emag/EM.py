import math
import numpy as np
from matplotlib import pyplot as plt

class EM:
    def __init__(self):
        self.speed_of_light = 299_792_458
        self.newt_grav_const = 6.6743015e-11
        self.planck_const = 6.62607015e-34
        self.elementary_charge = 1.602176634e-19
        self.permeabilityFS = 4*math.pi*10**-7
        self.permittivityFS = 8.854187812813e-12
        self.bohr_radius = 5.2917721090380e-11
        self.mass_of_electron = 9.109383701528e-31
        self.mass_of_proton = 1.6726219236951e-27
        self.boltzmann_const = 1.380649e-23
        self.avagadro_const = .02214076e-23
        self.atomic_mass_const = 1.6605390666050e-27
        self.faraday_const = 96485.33212
        self.molar_gas_const = 8.314462618
        