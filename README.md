# Microwave Engineering

This repository was developed as an evolving resource containing all things *Microwave Engineering*.

## Directory Structure

| Directory | Description |
| :-- | :-- |
| MATLAB | This directory contains MATLAB code (i.e., scripts, functions, classes) to execute common numerical calculations for the analysis, modeling, and simulation |
| Python | This directory contains Python code (i.e., scripts, functions, classes) to execute common numerical calculations for the analysis, modeling, and simulation |
| Data | This directory contains reference documents used to derive the code in the MATLAB and Python directories as well as a glossary of terms to define the terminology used in the reference documents and README.md files contained within each directory and/or subdirectory in this repository |

## Microwave Circuits

*Microwave Circuits* are a specialized subset of conventional circuit theory which are referred to as lumped element circuits. Lumped elements are those with physical dimensions much smaller than the wavelength such that voltage across and/or current through a conductor does not vary. Some examples of lumped elements include but are not limited to resistors, capacitors, and inductors. *Microwave Circuits* are those with physical dimensions on the order of or much larger than the wavelength of the propagating wave, and are more commonly referred to as distributed circuits. The analysis of lumped element circuits is an approximation; whereas, when analyzing distributed circuits the voltage and current vary, and phase change and transit times must be considered.

## Transmission Line Theory

*Transmission Line Theory* is the study of the subject which bridges the gap between plane waves and microwave circuits. This is a subject of significant importance with respect to the analysis of microwave circuits as an extension of both Maxwell's equations and conventional (lumped element) circuits. In this section we will expand upon various types of transmission media having varying architectures designed for specific applications.

### Lumped-Element Circuit Model for a Transmission Line

The lumped-element circuit model of a Transverse Electromagnetic (TEM) mode transmission line such as coaxial cable is often modeled as a two-wire (conductor) line since they always have at least two conductors. Therefore, a piece of line of infinitesimal length $\Delta z$ where the *resistance* ($R$), *inductance* ($L$), *conductance* ($G$), and *capacitance* ($C$) are modeled as per-unit-length quantities as follows:

$$
\begin{align}
    R &= \text{series resistance per unit length, for both conductors, in $\Omega/m$} \\
    L &= \text{series inductance per unit length, for both conductors, in H/m} \\
    G &= \text{shunt conductance per unit length, in S/m} \\
    C &= \text{shunt capacitance per unit length, in F/m} \\
\end{align}
$$

The series *inductance* $L$ represents the total self-inductance of the to conductors, and the shunt *capacitance* $C$ is due to the close proximity of the two conductors. The series *resistance* $R$ represents the resistance due to the finite conductivity of the individual conductors, and the shunt *conductance* $G$ is due to dielectric loss in the material between the conductors. Therefore, the values of $R$ and $G$ represent losses.

### Telegrapher's Equations

The *telegrapher's equations* are also commonly referred to as *telegraph equations* derived by Oliver Heaviside who developed the transmission line model. These equations are a set of two coupled, linear equations used to calculate voltage and current distributions on a linear electrical transmission line. More importantly, they allow transmission lines to be evaluated using conventional circuit theory. The following are the time-domain form of the *telegraph equations*:

$$
\begin{align}
    \dfrac{dV(z)}{dz} &= -(R + j \omega L) I(z) \\
    \dfrac{dI(z)}{dz} &= -(G + j \omega C)V(z)
\end{align}
$$

### Complex Propagation Constant

The *complex propagation constant* is a complex function of frequency representing the real and imaginary components of a wave, where $\alpha$ is the *attenuation constant* and $\beta$ is the $phase constant$. The *complex propagation constant* is defined mathematically as:

$$
\begin{equation}
    \gamma = \alpha + j\beta = \sqrt{(R + j\omega L)(G + j\omega C)}
\end{equation}
$$

where,

$$
\begin{equation}
    \beta = \dfrac{2\pi}{\lambda}
\end{equation}
$$

It is worth noting that $\alpha$ represents loss as the real component of a propagating wave. Therefore, a **lossless** transmission line would reduce the equation of the *complex propagation constant* $\gamma$ to only the imaginary component $\beta$ defined mathematically as follows:

$$
\begin{equation}
    \gamma = j\beta
\end{equation}
$$

Given the relationship between the *phase constant* $\beta$ and the *wavelength* $\lambda$ as defined in the equation above, when the value of $\beta$ is known, we can also calculate the value of the wavelength as follows:

$$
\begin{equation}
    \lambda = \dfrac{2\pi}{\beta}
\end{equation}
$$

### Wave Equations for Voltage & Current

The *wave equations* of a traveling wave can be calculated using the *complex propagation constant* above where $e^-{\gamma z}$ term represents a wave propagating in the $+z$ direction, and $e^{\gamma z}$ represents a wave propagating in the $-z$ direction. These wave equations are defined mathematically as follows:

$$
\begin{align}
    V(z) &= V_0^+ e^{-\gamma z} + V_0^- e^{\gamma z}\\
    I(z) &= I_0^+ e^{-\gamma z} + I_0^- e^{\gamma z}
\end{align}
$$

### Characteristic Impedance

The *characteristic impedance* of a transmission line is the ratio of the voltage to the current in a forward traveling direction in the absence of reflection in the opposing direction. When the values of $R$, $L$, $G$, $C$, and $\gamma$ are known, the characteristic impedance of a uniform transmission line is mathematically defined as follows:

$$
\begin{equation}
    Z_0 = \dfrac{R + j\omega L}{\gamma} = \sqrt{\dfrac{R + j\omega L}{G + j\omega C}}
\end{equation}
$$

### Phase Velocity

The *phase velocity* represents the speed and direction (velocity vector) at which the phase of a waave propagates through free-space or a medium, and defined mathematically as follows:

$$
\begin{equation}
    v_p = \dfrac{\omega}{\beta} = \lambda f
\end{equation}
$$

### Lossless Transmission Lines

In *lossless transmission lines* the real components (i.e., $R$ and $G$) of the wave are negated. In some instances the losses are so small they can be considered negligible to simply analysis. The following are variants of some of the above equations under **lossless** conditions:

#### Lossless Propagation Constant

By setting the values of $R=G=0$ the equation for the *propagation constant* can be mathematically defined as follows:

$$
\begin{equation}
    \gamma = \alpha + j\beta = j\omega \sqrt{LC}
\end{equation}
$$

where,

$$
\begin{align}
    \alpha &= 0 \\
    \beta &= \omega \sqrt{LC}
\end{align}
$$

#### Lossless Characteristic Impedance

Because the *attenuation constant* $\alpha = 0$, the *characteristic impedance* equation is reduced to the following:

$$
\begin{equation}
    Z_0 = \sqrt{\dfrac{L}{C}}
\end{equation}
$$

#### Lossless Wave Equations for Voltage & Current

$$
\begin{align}
    V(z) &= V_0^+ e^{-j\beta z} + V_0^- e^{j\beta z} \\
    I(z) &= I_0^+ e^{-j\beta z} + I_0^- e^{j\beta z}
\end{align}
$$

#### Lossless Wavelength

$$
\begin{equation}
    \lambda = \dfrac{2\pi}{\beta} = \dfrac{2\pi}{\omega \sqrt{LC}}
\end{equation}
$$

#### Lossless Phase Velocity

$$
\begin{equation}
    v_p = \dfrac{\omega}{\beta} = \dfrac{1}{\sqrt{LC}}
\end{equation}
$$

## Structure of a Two-Line Element (TLE) File

### Introduction to Two-Line Element (TLE) Files

Despite the name (Two-line Element), there is often three (3) lines, which are the 0th, 1st, and 2nd lines. The *Two Lines* that describe the orbit of the satellite are lines 1 and 2. The 0th line is used to identify the name of the object, or in cases where the name of the spave vehicle (SV) are not publicly available, the 0th line will represent the name of the TLE file relative to the SV it is intended to be used to track. Most TLEs are publicly available to view and/or download. Two commonly used resources are [space-track.org](http://www.space-track.org/) and/or [CelesTrak](http://www.celestrak.com/) which can be accessed by selecting the highlighted links.

### TLE Format

Two-Line Element files are simply ASCII formatted text files used to represent the properties of an object/SV for the purposes of locating these objects/SVs to track, transmit to and/or receive with an atenna capable of transmitting and/or receiving based upon the design characteristics of both the object/SV and the antenna.

#### Format Definition of Line 0

Line 0 is provided in a Three-Line Element Set file, and is not included in a Two-Line Element Set. The line contains the name of the object/SV, up to 11 characters.

#### Format Definition of Line 1

**Line 1 of a TLE entry contains general descriptive information of the object itself (classification, origin, etc.), along with information describing the force model parameters (drag/solar radiation pressure, time derivatives, etc.)**. This line can contain no more than 69 characters to include white space. The term character is used interchangably with the term columns. The lines of the TLE files are simply character strings; therefore, character 1 of a TLE file is column 1, character 2 is column 2, and so on for no more than 69 characters/columns. The following is a table defining the columns, and the content they represent:

| Column | Description |
| :-- | :-- |
| 1 | Line number |
| 3-7 | Catalog number |
| 8 | Classification ('U' = Uclassified, 'C' = Classified, 'S' = Secret) |
| 10-17 | [International Designator](https://ai-solutions.com/_help_Files/twolineelement_internationaldesignator_nanosecond.htm) where columns 10-11 indicate the launch year; columns 12-14 indicate the launch number of the launch year; columns 15-17 indicate the piece of the laucnh |
| 19-32 | TLE [Epoch](https://ai-solutions.com/_help_Files/twolineelement_epoch_nanosecond.htm) where columns 19-20 indicate the last two digits of the Epoch year; columns 21-32 indicate the day of the year followed by the fractional portion of the day (*Note: columns 21-22 may contain a space, A, or N to represent a space, if the day of the year is a single digit number.*) |
| 34-43 | [First Time Derivative of the Mean Motion](https://ai-solutions.com/_help_Files/twolineelement_meanmotiondot_nanosecond.htm) (*Note: the "+", "-", or space character is acceptable in the 34th character/column position. The column is used to represent a positive (i.e., "+", or space) value, or a negative (i.e., "-") value.*) |
| 45-52 | [Second Time Derivative of the Mean Motion](https://ai-solutions.com/_help_Files/twolineelement_meanmotionddot_nanosecond.htm) for which there is a decimal point assumed |
| 54-61 | [B* drag term](https://ai-solutions.com/_help_Files/twolineelement_bstar_nanosecond.htm) for which there is a decimal point assumed |
| 63 | [Ephemeris Type](https://ai-solutions.com/_help_Files/twolineelement_ephemeristype_nanosecond.htm) |
| 65-68 | [Element Number](https://ai-solutions.com/_help_Files/twolineelement_elementsetnumber_nanosecond.htm) |
| 69 | Checksum (modulo 10) |

##### Notes Specific to Line 1 of a TLE File

1. Replacing the first digit of the 5-digit catalog number with an alphanumeric character provides the ability for the TLE format to represent up to 339,999 objects. This numbering schema implemented by the United States Space Force (USSF) is known as Alpha-5. The letters "I" and "O" are omitted to avoid confusion with the numbers "1" and "0". The catalog number maps to the [Alpha5ID](https://ai-solutions.com/_help_Files/twolineelement_alpha5id_nanosecond.htm) and [Satellite Number](https://ai-solutions.com/_help_Files/twolineelement_satellitenumber_nanosecond.htm) properties for the [TLE](https://ai-solutions.com/_help_Files/twolineelement_nanosecond.htm) and [SGP4Properties](https://ai-solutions.com/_help_Files/sgp4properties_nanosecond.htm) objects. More information is available at [this](https://www.space-track.org/documentation#tle-alpha5) link.
2. Although the AstroStds documentation states that Type 0 is used for states generated using the old/deprecated SGP algorithm, we often observe Type 0 being used to label states that were generated using the SGP4 algorithm using Kozai mean motion, and Type 2 being used to label states that were generated using the SGP4 algorithm using Brouwer mean motion. Type 4 indicates that the state elements are calculated and will be propagated using the SGP4-XP algorithm. See [Type 4 Ephemerides](https://ai-solutions.com/_help_Files/two-line_element_set_file.htm#achr_type4ephemerides) for details on format changes between Types 0/2 and Type 4.
3. In the table above, 'A's can represent any character between A-Z *or a space* and 'N's can represent any number between 0-9 *or a space*. In Line 1 of a TLE, columns {2, 9, 18, 33, 44, 53, 62, and 64} are meaningless to the properties defined in the TLE and will be represented by a space, or by one of the characters A or N (which can also represent a space).

#### Format Definition of Line 2

Line 2 of the TLE entry contains the state data of the object/SV. This line can contain no more than 69 characters to include white space. The term character is used interchangably with the term columns. Therefore, Line 1 of a TLE file is column 1, Line 2 is column 2, and so on for no more than 69 characters/columns. The following is a table defining the columns, and the content they represent:

| Column | Description |
| :-- | :-- |
| 1 | Line number |
| 3-7 | Satellite Catalog number |
| 9-16 | [Orbit Inclination](https://ai-solutions.com/_help_Files/twolineelement_inclination_nanosecond.htm) in units of degrees |
| 18-25 | [Right Ascension of the Ascending Node](https://ai-solutions.com/_help_Files/twolineelement_raan_nanosecond.htm) in units of degrees |
| 27-33 | [Eccentricity](https://ai-solutions.com/_help_Files/twolineelement_eccentricity_nanosecond.htm) for which there is a decimal point assumed |
| 35-42 | [Argument of Perigee](https://ai-solutions.com/_help_Files/twolineelement_argumentofperigee_nanosecond.htm) in units of degrees |
| 44-51 | [Mean Anomaly](https://ai-solutions.com/_help_Files/twolineelement_meananomaly_nanosecond.htm) in units of degrees |
| 53-63 | [Mean Motion](https://ai-solutions.com/_help_Files/twolineelement_meanmotion_nanosecond.htm) indicating the number of earth revolutions per day |
| 64-68 | [Revolution Number at Epoch](https://ai-solutions.com/_help_Files/twolineelement_revolutionnumber_nanosecond.htm) indicating the number of earth revolutions at Epoch |
| 69 | Checksum (modulo 10) |

##### Notes Specific to Line 2 of a TLE File

1. In the table above, 'A's can represent any character between A-Z *or a space* and 'N's can represent any number between 0-9 *or a space*. In Line 1 of a TLE, columns {2, 8, 17, 26, 34, 43, 52, and 64} are meaningless to the properties defined in the TLE and will be represented by a space, or by one of the characters A or N (which can also represent a space).

#### Type 4 Emphemerides

The Ephemeris Type 4 TLE uses the [SGP4-XP](https://ai-solutions.com/_help_Files/working_with_tles_sgp4.htm) algorithm for propagation, which accounts for additional forces and perturbations on top of the standard SGP4 algorithm. This format includes the AGOM (Area times Gamma Over Mass, where Gamma = [Cr](https://ai-solutions.com/_help_Files/spacecraft_cr_nanosecond.htm)) term and uses the B term (as defined by USSF) instead of B*. The B term still maps to the [Bstar](https://ai-solutions.com/_help_Files/twolineelement_bstar_nanosecond.htm) property. These terms are represented on Line 1 of the TLE format in place of the [MeanMotionDDot](https://ai-solutions.com/_help_Files/twolineelement_meanmotionddot_nanosecond.htm) (columns 46-52) and [BStar](https://ai-solutions.com/_help_Files/twolineelement_bstar_nanosecond.htm) (columns 54-61) terms from the Line 1 as indicated below:

| Column | Description |
| :-- | :-- |
| 1 | Line number |
| 3-7 | Catalog number |
| 8 | Classification ('U' = Uclassified, 'C' = Classified, 'S' = Secret) |
| 10-11 | [International Designator](https://ai-solutions.com/_help_Files/twolineelement_internationaldesignator_nanosecond.htm) indicating the last two digits of the launch year |
| 12-14 | [International Designator](https://ai-solutions.com/_help_Files/twolineelement_internationaldesignator_nanosecond.htm) indicating the launch number of that year |
| 15-17 | [International Designator](https://ai-solutions.com/_help_Files/twolineelement_internationaldesignator_nanosecond.htm) indicating the piece of the launch |
| 19-20 | Epoch year (Last two digits of year) |
| 21-32 | [Epoch](https://ai-solutions.com/_help_Files/twolineelement_epoch_nanosecond.htm) indicating the day of the year followed by the fractional portion of the day |
| 34-43 | [First Time Derivative of the Mean Motion](https://ai-solutions.com/_help_Files/twolineelement_meanmotiondot_nanosecond.htm) |
| 45-52 | [AGOM](https://ai-solutions.com/_help_Files/twolineelement_agom_nanosecond.htm) for which there is a decimal point assumed |
| 54-61 | [B drag term](https://ai-solutions.com/_help_Files/twolineelement_bstar_nanosecond.htm) for which there is a decimal point assumed |
| 63 | [Ephemeris Type](https://ai-solutions.com/_help_Files/twolineelement_ephemeristype_nanosecond.htm) |
| 65-68 | [Element Number](https://ai-solutions.com/_help_Files/twolineelement_elementsetnumber_nanosecond.htm) |
| 69 | Checksum (modulo 10) |

##### Notes Specific to the Type 4 Ephemerides TLE Variant

1. The only observable changes made to this format are the properties in **Line 1** for columns 42-52 and 54-61 as defined in the table above. More information can be found on these differences by clicking the associated links if you require additional detail.
