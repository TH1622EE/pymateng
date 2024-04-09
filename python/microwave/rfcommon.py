##################################################################################################
# Author:   Tim Holden
# Date:     4/9/2024
# Python:   Version 3.12.2
# Purpose:  This class was created to store common RF/Microwave attributes and methods
##################################################################################################

import math

class RFCommon:

    def __init__(self):

        # Physical Constants
        LIGHT_SPEED = 299792458
        BOLTZMAN = 1.38649e-23
        PLANCK = 6.62607015e-34
        PERMITTIVITY_FS = 8.854187812813e-12
        PERMEABILITY_FS = 4*math.pi*10**-7
        
        # Angular Values
        self.theta = 0
        self.thetad = 0
        self.phi = 0
        self.phid = 0

        # Common attributes
        self.wavelength = 0
        self.atten_const = 0
        self.phase_const = 0
        self.resistance = 0
        self.inductance = 0
        self.conductance = 0
        self.capacitance = 0
        self.char_impedance = 0
        self.input_impedance = 0
        self.load_impedance = 0

    # Getters and Setters
    def set_theta(self, theta):
        self.theta 

    def get_theta(self):
        return self.theta 

    def set_thetad(self, thetad):
        self.thetad 

    def get_thetad(self):
        return self.thetad 

    def set_phi(self, phi):
        self.phi 

    def get_phi(self):
        return self.phi

    def set_phid(self, phid):
        self.phid = phid 

    def get_phid(self):
        return self.phid 

    def set_wavelength(self, wavelength):
        self.wavelength = wavelength

    def get_wavelength(self):
        return self.wavelength 

    def set_atten_const(self, alpha):
        self.atten_const = alpha

    def get_atten_const(self):
        return self.atten_const 

    def set_phase_const(self, beta):
        self.phase_const = beta 

    def get_phase_const(self):
        return self.phase_const

    def set_resistance(self, R):
        self.resistance = R 

    def get_resistance(self):
        return self.resistance 

    def set_inductance(self, L):
        self.inductance = L 

    def get_inductance(self):
        return self.inductance 

    def set_conductance(self, G):
        self.conductance = G 

    def get_conductance(self):
        return self.conductance 

    def set_capacitance(self, C):
        self.capacitance = C 

    def get_capacitance(self):
        return self.capacitance 

    def set_char_impedance(self, z0):
        self.char_impedance = z0 

    def get_char_impedance(self):
        return self.char_impedance

    def set_input_impedance(self, zin):
        self.input_impedance = zin 

    def get_input_impedance(self):
        return self.input_impedance

    def set_load_impedance(self, zl):
        self.load_impedance = zl 
