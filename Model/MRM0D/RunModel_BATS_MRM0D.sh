#!/bin/sh

#max_epsilon is the maximum exoenzyme production rate

#qfrac is the fraction of the surface area of the spherical particle covered by a single layer of bacteria, values greater than 1 mean that there is a second layer of bacteria

#For higher resolution of max_epsilon, copy and paste this list into the code: 0.0000 0.0005 0.0010 0.0015 0.0020 0.0025 0.0030 0.0035 0.0040 0.0045 0.0050 0.0055 0.0060 0.0065 0.0070 0.0075 0.0080 0.0085 0.0090 0.0095 0.0100 0.0105 0.0110 0.0115 0.0120 0.0125 0.0130 0.0135 0.0140 0.0145 0.0150 0.0155 0.0160 0.0165 0.0170 0.0175 0.0180 0.0185 0.0190 0.0195 0.0200 0.0205 0.0210 0.0215 0.0220 0.0225 0.0230 0.0235 0.0240 0.0245 0.0250 0.0255 0.0260 0.0265 0.0270 0.0275 0.0280 0.0285 0.0290 0.0295 0.0300 0.0305 0.0310 0.0315 0.0320 0.0325 0.0330 0.0335 0.0340 0.0345 0.0350 0.0355 0.0360 0.0365 0.0370 0.0375 0.0380 0.0385 0.0390 0.0395 0.0400 0.0405 0.0410 0.0415 0.0420 0.0425 0.0430 0.0435 0.0440 0.0445 0.0450 0.0455 0.0460 0.0465 0.0470 0.0475 0.0480 0.0485 0.0490 0.0495 0.0500

for max_epsilon in 0.0000 0.0100 0.0200 0.0300 0.0400 0.0500
do
for qfrac in 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 0.14 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 0.24 0.25 0.26 0.27 0.28 0.29 0.30 0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41 0.42 0.43 0.44 0.45 0.46 0.47 0.48 0.49 0.50 0.51 0.52 0.53 0.54 0.55 0.56 0.57 0.58 0.59 0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68 0.69 0.70 0.71 0.72 0.73 0.74 0.75 0.76 0.77 0.78 0.79 0.80 0.81 0.82 0.83 0.84 0.85 0.86 0.87 0.88 0.89 0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99 1.00 1.01 1.02 1.03 1.04 1.05 1.06 1.07 1.08 1.09 1.10
do
	echo "&control" > grow2.input
	echo "qfrac =" ${qfrac} >> grow2.input
	echo "max_epsilon =" ${max_epsilon} >> grow2.input
	echo "/" >> grow2.input
	echo " " >> grow2.input

./MRM0D < grow2.input
cp StateVariables.out ../../Output/MRM0D/StateVariables/StateVariables_maxe${max_epsilon}_qfrac${qfrac}.out
cp BacteriaRates.out ../../Output/MRM0D/BacteriaRates/BacteriaRates_maxe${max_epsilon}_qfrac${qfrac}.out
cp MassTransferRates.out ../../Output/MRM0D/MassTransferRates/MassTransferRates_maxe${max_epsilon}_qfrac${qfrac}.out

rm MassTransferRates.out
rm StateVariables.out
rm BacteriaRates.out
rm grow2.input

done
done