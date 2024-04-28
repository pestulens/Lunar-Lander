/*
 * lunar_lander_sim_PWPF_2023a_data.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "lunar_lander_sim_PWPF_2023a".
 *
 * Model version              : 1.1
 * Simulink Coder version : 9.9 (R2023a) 19-Nov-2022
 * C source code generated on : Sat Apr 13 16:20:58 2024
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "lunar_lander_sim_PWPF_2023a.h"

/* Block parameters (default storage) */
P_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_P = {
  /* Mask Parameter: PIDController3_D
   * Referenced by: '<S37>/Derivative Gain'
   */
  8.0,

  /* Mask Parameter: PIDController4_D
   * Referenced by: '<S85>/Derivative Gain'
   */
  8.0,

  /* Mask Parameter: PIDController5_D
   * Referenced by: '<S133>/Derivative Gain'
   */
  12.0,

  /* Mask Parameter: PIDController3_I
   * Referenced by: '<S40>/Integral Gain'
   */
  0.5,

  /* Mask Parameter: PIDController4_I
   * Referenced by: '<S88>/Integral Gain'
   */
  0.1,

  /* Mask Parameter: PIDController5_I
   * Referenced by: '<S136>/Integral Gain'
   */
  0.2,

  /* Mask Parameter: PIDController3_InitialCondition
   * Referenced by: '<S38>/Filter'
   */
  0.0,

  /* Mask Parameter: PIDController4_InitialCondition
   * Referenced by: '<S86>/Filter'
   */
  0.0,

  /* Mask Parameter: PIDController5_InitialCondition
   * Referenced by: '<S134>/Filter'
   */
  0.0,

  /* Mask Parameter: PIDController3_InitialConditi_f
   * Referenced by: '<S43>/Integrator'
   */
  0.0,

  /* Mask Parameter: PIDController4_InitialConditi_l
   * Referenced by: '<S91>/Integrator'
   */
  0.0,

  /* Mask Parameter: PIDController5_InitialConditi_l
   * Referenced by: '<S139>/Integrator'
   */
  0.0,

  /* Mask Parameter: PIDController3_N
   * Referenced by: '<S46>/Filter Coefficient'
   */
  1000.0,

  /* Mask Parameter: PIDController4_N
   * Referenced by: '<S94>/Filter Coefficient'
   */
  1000.0,

  /* Mask Parameter: PIDController5_N
   * Referenced by: '<S142>/Filter Coefficient'
   */
  1000.0,

  /* Mask Parameter: PIDController3_P
   * Referenced by: '<S48>/Proportional Gain'
   */
  3.0,

  /* Mask Parameter: PIDController4_P
   * Referenced by: '<S96>/Proportional Gain'
   */
  2.0,

  /* Mask Parameter: PIDController5_P
   * Referenced by: '<S144>/Proportional Gain'
   */
  3.0,

  /* Expression: [0;0;0]
   * Referenced by: '<Root>/ phi theta psi initial condition'
   */
  { 0.0, 0.0, 0.0 },

  /* Computed Parameter: TransferFcn_A
   * Referenced by: '<S7>/Transfer Fcn'
   */
  -6.666666666666667,

  /* Computed Parameter: TransferFcn_C
   * Referenced by: '<S7>/Transfer Fcn'
   */
  26.666666666666668,

  /* Expression: 0.5
   * Referenced by: '<S158>/Relay'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S158>/Relay'
   */
  0.15,

  /* Expression: 4.5
   * Referenced by: '<S158>/Relay'
   */
  4.5,

  /* Expression: 0
   * Referenced by: '<S158>/Relay'
   */
  0.0,

  /* Expression: -1
   * Referenced by: '<S158>/Gain'
   */
  -1.0,

  /* Expression: 0.5
   * Referenced by: '<S158>/Relay1'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S158>/Relay1'
   */
  0.15,

  /* Expression: -4.5
   * Referenced by: '<S158>/Relay1'
   */
  -4.5,

  /* Expression: 0
   * Referenced by: '<S158>/Relay1'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S158>/Switch'
   */
  0.0,

  /* Computed Parameter: TransferFcn_A_e
   * Referenced by: '<S5>/Transfer Fcn'
   */
  -6.666666666666667,

  /* Computed Parameter: TransferFcn_C_o
   * Referenced by: '<S5>/Transfer Fcn'
   */
  26.666666666666668,

  /* Expression: 0.5
   * Referenced by: '<S156>/Relay'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S156>/Relay'
   */
  0.15,

  /* Expression: 4.5
   * Referenced by: '<S156>/Relay'
   */
  4.5,

  /* Expression: 0
   * Referenced by: '<S156>/Relay'
   */
  0.0,

  /* Expression: -1
   * Referenced by: '<S156>/Gain'
   */
  -1.0,

  /* Expression: 0.5
   * Referenced by: '<S156>/Relay1'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S156>/Relay1'
   */
  0.15,

  /* Expression: -4.5
   * Referenced by: '<S156>/Relay1'
   */
  -4.5,

  /* Expression: 0
   * Referenced by: '<S156>/Relay1'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S156>/Switch'
   */
  0.0,

  /* Computed Parameter: TransferFcn_A_et
   * Referenced by: '<S6>/Transfer Fcn'
   */
  -6.666666666666667,

  /* Computed Parameter: TransferFcn_C_m
   * Referenced by: '<S6>/Transfer Fcn'
   */
  26.666666666666668,

  /* Expression: 0.5
   * Referenced by: '<S157>/Relay'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S157>/Relay'
   */
  0.15,

  /* Expression: 4.5
   * Referenced by: '<S157>/Relay'
   */
  4.5,

  /* Expression: 0
   * Referenced by: '<S157>/Relay'
   */
  0.0,

  /* Expression: -1
   * Referenced by: '<S157>/Gain'
   */
  -1.0,

  /* Expression: 0.5
   * Referenced by: '<S157>/Relay1'
   */
  0.5,

  /* Expression: 0.15
   * Referenced by: '<S157>/Relay1'
   */
  0.15,

  /* Expression: -4.5
   * Referenced by: '<S157>/Relay1'
   */
  -4.5,

  /* Expression: 0
   * Referenced by: '<S157>/Relay1'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S157>/Switch'
   */
  0.0,

  /* Expression: 0.3
   * Referenced by: '<Root>/Constant1'
   */
  0.3,

  /* Expression: [30;20;0]
   * Referenced by: '<Root>/phi theta psi command1'
   */
  { 30.0, 20.0, 0.0 },

  /* Expression: pi/180
   * Referenced by: '<S1>/Gain1'
   */
  0.017453292519943295,

  /* Expression: pi/180
   * Referenced by: '<S161>/Gain1'
   */
  0.017453292519943295,

  /* Expression: 0.8
   * Referenced by: '<S5>/Gain2'
   */
  0.8,

  /* Expression: 0.8
   * Referenced by: '<S6>/Gain2'
   */
  0.8,

  /* Expression: 0.8
   * Referenced by: '<S7>/Gain2'
   */
  0.8,

  /* Expression: [0;0;0]
   * Referenced by: '<Root>/p q r initial condition'
   */
  { 0.0, 0.0, 0.0 },

  /* Expression: [0.619 -0.008 0;-0.008 0.782 0;0 0 1.226]
   * Referenced by: '<S10>/Inertie'
   */
  { 0.619, -0.008, 0.0, -0.008, 0.782, 0.0, 0.0, 0.0, 1.226 },

  /* Expression: zeros(3)
   * Referenced by: '<S10>/I_dot'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
};
