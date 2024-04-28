/*
 * lunar_lander_sim_PWPF_2023a.c
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
#include "rtwtypes.h"
#include <math.h>
#include <emmintrin.h>
#include "lunar_lander_sim_PWPF_2023a_private.h"
#include <string.h>
#include "rt_nonfinite.h"

/* Block signals (default storage) */
B_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_B;

/* Continuous states */
X_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_X;

/* Block states (default storage) */
DW_lunar_lander_sim_PWPF_2023_T lunar_lander_sim_PWPF_2023a_DW;

/* Real-time model */
static RT_MODEL_lunar_lander_sim_PWP_T lunar_lander_sim_PWPF_2023a_M_;
RT_MODEL_lunar_lander_sim_PWP_T *const lunar_lander_sim_PWPF_2023a_M =
  &lunar_lander_sim_PWPF_2023a_M_;

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 15;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  lunar_lander_sim_PWPF_2023a_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  lunar_lander_sim_PWPF_2023a_step();
  lunar_lander_sim_PWPF_2023a_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  lunar_lander_sim_PWPF_2023a_step();
  lunar_lander_sim_PWPF_2023a_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

void rt_mrdivide_U1d1x3_U2d_9vOrDY9Z(const real_T u0[3], const real_T u1[9],
  real_T y[3])
{
  real_T A[9];
  real_T a21;
  real_T maxval;
  int32_T r1;
  int32_T r2;
  int32_T r3;
  memcpy(&A[0], &u1[0], 9U * sizeof(real_T));
  r1 = 0;
  r2 = 1;
  r3 = 2;
  maxval = fabs(u1[0]);
  a21 = fabs(u1[1]);
  if (a21 > maxval) {
    maxval = a21;
    r1 = 1;
    r2 = 0;
  }

  if (fabs(u1[2]) > maxval) {
    r1 = 2;
    r2 = 1;
    r3 = 0;
  }

  A[r2] = u1[r2] / u1[r1];
  A[r3] /= A[r1];
  A[r2 + 3] -= A[r1 + 3] * A[r2];
  A[r3 + 3] -= A[r1 + 3] * A[r3];
  A[r2 + 6] -= A[r1 + 6] * A[r2];
  A[r3 + 6] -= A[r1 + 6] * A[r3];
  if (fabs(A[r3 + 3]) > fabs(A[r2 + 3])) {
    int32_T rtemp;
    rtemp = r2 + 1;
    r2 = r3;
    r3 = rtemp - 1;
  }

  A[r3 + 3] /= A[r2 + 3];
  A[r3 + 6] -= A[r3 + 3] * A[r2 + 6];
  y[r1] = u0[0] / A[r1];
  y[r2] = u0[1] - A[r1 + 3] * y[r1];
  y[r3] = u0[2] - A[r1 + 6] * y[r1];
  y[r2] /= A[r2 + 3];
  y[r3] -= A[r2 + 6] * y[r2];
  y[r3] /= A[r3 + 6];
  y[r2] -= A[r3 + 3] * y[r3];
  y[r1] -= y[r3] * A[r3];
  y[r1] -= y[r2] * A[r2];
}

/* Model step function */
void lunar_lander_sim_PWPF_2023a_step(void)
{
  __m128d tmp_0;
  __m128d tmp_1;
  __m128d tmp_2;
  __m128d tmp_3;
  __m128d tmp_4;
  __m128d tmp_5;
  real_T rtb_VectorConcatenate[18];
  real_T rtb_Divide[3];
  real_T rtb_Sum_f[3];
  real_T rtb_Sum_lp[3];
  real_T tmp[3];
  real_T rtb_Gain;
  real_T rtb_Integrator_idx_1;
  real_T rtb_Integrator_idx_2;
  real_T rtb_TransferFcn;
  real_T rtb_TransferFcn_c;
  real_T rtb_TransferFcn_n;
  int32_T i;
  int32_T rtb_VectorConcatenate_tmp;
  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* set solver stop time */
    if (!(lunar_lander_sim_PWPF_2023a_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                            ((lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH0
        + 1) * lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                            ((lunar_lander_sim_PWPF_2023a_M->Timing.clockTick0 +
        1) * lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0 +
        lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH0 *
        lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    lunar_lander_sim_PWPF_2023a_M->Timing.t[0] = rtsiGetT
      (&lunar_lander_sim_PWPF_2023a_M->solverInfo);
  }

  /* TransferFcn: '<S7>/Transfer Fcn' */
  rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_P.TransferFcn_C *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE;

  /* Relay: '<S158>/Relay' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay_Mode = ((rtb_TransferFcn >=
      lunar_lander_sim_PWPF_2023a_P.Relay_OnVal) || ((!(rtb_TransferFcn <=
      lunar_lander_sim_PWPF_2023a_P.Relay_OffVal)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay_Mode));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay_Mode) {
    /* Relay: '<S158>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOn;
  } else {
    /* Relay: '<S158>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOff;
  }

  /* End of Relay: '<S158>/Relay' */

  /* Gain: '<S158>/Gain' */
  rtb_Gain = lunar_lander_sim_PWPF_2023a_P.Gain_Gain * rtb_TransferFcn;

  /* Relay: '<S158>/Relay1' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode = ((rtb_Gain >=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OnVal) || ((!(rtb_Gain <=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OffVal)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode) {
    /* Relay: '<S158>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1 =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOn;
  } else {
    /* Relay: '<S158>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1 =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOff;
  }

  /* End of Relay: '<S158>/Relay1' */

  /* Switch: '<S158>/Switch' */
  if (rtb_TransferFcn > lunar_lander_sim_PWPF_2023a_P.Switch_Threshold) {
    rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_B.Relay;
  } else {
    rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_B.Relay1;
  }

  /* End of Switch: '<S158>/Switch' */

  /* TransferFcn: '<S5>/Transfer Fcn' */
  rtb_TransferFcn_n = lunar_lander_sim_PWPF_2023a_P.TransferFcn_C_o *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_h;

  /* Relay: '<S156>/Relay' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_a = ((rtb_TransferFcn_n >=
      lunar_lander_sim_PWPF_2023a_P.Relay_OnVal_p) || ((!(rtb_TransferFcn_n <=
      lunar_lander_sim_PWPF_2023a_P.Relay_OffVal_f)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_a));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_a) {
    /* Relay: '<S156>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay_c =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOn_m;
  } else {
    /* Relay: '<S156>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay_c =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOff_d;
  }

  /* End of Relay: '<S156>/Relay' */

  /* Gain: '<S156>/Gain' */
  rtb_Gain = lunar_lander_sim_PWPF_2023a_P.Gain_Gain_d * rtb_TransferFcn_n;

  /* Relay: '<S156>/Relay1' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_d = ((rtb_Gain >=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OnVal_g) || ((!(rtb_Gain <=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OffVal_e)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_d));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_d) {
    /* Relay: '<S156>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1_j =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOn_i;
  } else {
    /* Relay: '<S156>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1_j =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOff_c;
  }

  /* End of Relay: '<S156>/Relay1' */

  /* Switch: '<S156>/Switch' */
  if (rtb_TransferFcn_n > lunar_lander_sim_PWPF_2023a_P.Switch_Threshold_o) {
    rtb_TransferFcn_n = lunar_lander_sim_PWPF_2023a_B.Relay_c;
  } else {
    rtb_TransferFcn_n = lunar_lander_sim_PWPF_2023a_B.Relay1_j;
  }

  /* End of Switch: '<S156>/Switch' */

  /* TransferFcn: '<S6>/Transfer Fcn' */
  rtb_TransferFcn_c = lunar_lander_sim_PWPF_2023a_P.TransferFcn_C_m *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_hb;

  /* Relay: '<S157>/Relay' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_l = ((rtb_TransferFcn_c >=
      lunar_lander_sim_PWPF_2023a_P.Relay_OnVal_b) || ((!(rtb_TransferFcn_c <=
      lunar_lander_sim_PWPF_2023a_P.Relay_OffVal_n)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_l));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay_Mode_l) {
    /* Relay: '<S157>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay_j =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOn_i;
  } else {
    /* Relay: '<S157>/Relay' */
    lunar_lander_sim_PWPF_2023a_B.Relay_j =
      lunar_lander_sim_PWPF_2023a_P.Relay_YOff_g;
  }

  /* End of Relay: '<S157>/Relay' */

  /* Gain: '<S157>/Gain' */
  rtb_Gain = lunar_lander_sim_PWPF_2023a_P.Gain_Gain_j * rtb_TransferFcn_c;

  /* Relay: '<S157>/Relay1' */
  if (rtsiIsModeUpdateTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo)) {
    lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_n = ((rtb_Gain >=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OnVal_b) || ((!(rtb_Gain <=
      lunar_lander_sim_PWPF_2023a_P.Relay1_OffVal_n)) &&
      lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_n));
  }

  if (lunar_lander_sim_PWPF_2023a_DW.Relay1_Mode_n) {
    /* Relay: '<S157>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1_e =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOn_i5;
  } else {
    /* Relay: '<S157>/Relay1' */
    lunar_lander_sim_PWPF_2023a_B.Relay1_e =
      lunar_lander_sim_PWPF_2023a_P.Relay1_YOff_j;
  }

  /* End of Relay: '<S157>/Relay1' */

  /* Switch: '<S157>/Switch' */
  if (rtb_TransferFcn_c > lunar_lander_sim_PWPF_2023a_P.Switch_Threshold_j) {
    rtb_TransferFcn_c = lunar_lander_sim_PWPF_2023a_B.Relay_j;
  } else {
    rtb_TransferFcn_c = lunar_lander_sim_PWPF_2023a_B.Relay1_e;
  }

  /* End of Switch: '<S157>/Switch' */
  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* Gain: '<S1>/Gain1' incorporates:
     *  Constant: '<Root>/phi theta psi command1'
     */
    lunar_lander_sim_PWPF_2023a_B.Gain1[0] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain *
      lunar_lander_sim_PWPF_2023a_P.phithetapsicommand1_Value[0];
    lunar_lander_sim_PWPF_2023a_B.Gain1[1] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain *
      lunar_lander_sim_PWPF_2023a_P.phithetapsicommand1_Value[1];
    lunar_lander_sim_PWPF_2023a_B.Gain1[2] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain *
      lunar_lander_sim_PWPF_2023a_P.phithetapsicommand1_Value[2];

    /* Gain: '<S161>/Gain1' incorporates:
     *  Constant: '<Root>/ phi theta psi initial condition'
     */
    lunar_lander_sim_PWPF_2023a_B.Gain1_o[0] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain_m *
      lunar_lander_sim_PWPF_2023a_P.phithetapsiinitialcondition_Val[0];
    lunar_lander_sim_PWPF_2023a_B.Gain1_o[1] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain_m *
      lunar_lander_sim_PWPF_2023a_P.phithetapsiinitialcondition_Val[1];
    lunar_lander_sim_PWPF_2023a_B.Gain1_o[2] =
      lunar_lander_sim_PWPF_2023a_P.Gain1_Gain_m *
      lunar_lander_sim_PWPF_2023a_P.phithetapsiinitialcondition_Val[2];
  }

  /* Product: '<Root>/Divide' incorporates:
   *  Constant: '<Root>/Constant1'
   *  SignalConversion generated from: '<Root>/Vector Concatenate1'
   * */
  rtb_Divide[0] = lunar_lander_sim_PWPF_2023a_P.Constant1_Value *
    rtb_TransferFcn;
  rtb_Divide[1] = lunar_lander_sim_PWPF_2023a_P.Constant1_Value *
    rtb_TransferFcn_n;
  rtb_Divide[2] = lunar_lander_sim_PWPF_2023a_P.Constant1_Value *
    rtb_TransferFcn_c;

  /* Integrator: '<S159>/ ' */
  if (lunar_lander_sim_PWPF_2023a_DW._IWORK != 0) {
    lunar_lander_sim_PWPF_2023a_X._CSTATE[0] =
      lunar_lander_sim_PWPF_2023a_B.Gain1_o[0];
    lunar_lander_sim_PWPF_2023a_X._CSTATE[1] =
      lunar_lander_sim_PWPF_2023a_B.Gain1_o[1];
    lunar_lander_sim_PWPF_2023a_X._CSTATE[2] =
      lunar_lander_sim_PWPF_2023a_B.Gain1_o[2];
  }

  /* Sum: '<Root>/Sum1' incorporates:
   *  Integrator: '<S159>/ '
   */
  rtb_Gain = lunar_lander_sim_PWPF_2023a_B.Gain1[0] -
    lunar_lander_sim_PWPF_2023a_X._CSTATE[0];
  rtb_Integrator_idx_1 = lunar_lander_sim_PWPF_2023a_B.Gain1[1] -
    lunar_lander_sim_PWPF_2023a_X._CSTATE[1];
  rtb_Integrator_idx_2 = lunar_lander_sim_PWPF_2023a_B.Gain1[2] -
    lunar_lander_sim_PWPF_2023a_X._CSTATE[2];

  /* Gain: '<S40>/Integral Gain' */
  lunar_lander_sim_PWPF_2023a_B.IntegralGain =
    lunar_lander_sim_PWPF_2023a_P.PIDController3_I * rtb_Gain;

  /* Gain: '<S46>/Filter Coefficient' incorporates:
   *  Gain: '<S37>/Derivative Gain'
   *  Integrator: '<S38>/Filter'
   *  Sum: '<S38>/SumD'
   */
  lunar_lander_sim_PWPF_2023a_B.FilterCoefficient =
    (lunar_lander_sim_PWPF_2023a_P.PIDController3_D * rtb_Gain -
     lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE) *
    lunar_lander_sim_PWPF_2023a_P.PIDController3_N;

  /* Gain: '<S88>/Integral Gain' */
  lunar_lander_sim_PWPF_2023a_B.IntegralGain_e =
    lunar_lander_sim_PWPF_2023a_P.PIDController4_I * rtb_Integrator_idx_1;

  /* Gain: '<S94>/Filter Coefficient' incorporates:
   *  Gain: '<S85>/Derivative Gain'
   *  Integrator: '<S86>/Filter'
   *  Sum: '<S86>/SumD'
   */
  lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_n =
    (lunar_lander_sim_PWPF_2023a_P.PIDController4_D * rtb_Integrator_idx_1 -
     lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE_g) *
    lunar_lander_sim_PWPF_2023a_P.PIDController4_N;

  /* Gain: '<S136>/Integral Gain' */
  lunar_lander_sim_PWPF_2023a_B.IntegralGain_d =
    lunar_lander_sim_PWPF_2023a_P.PIDController5_I * rtb_Integrator_idx_2;

  /* Gain: '<S142>/Filter Coefficient' incorporates:
   *  Gain: '<S133>/Derivative Gain'
   *  Integrator: '<S134>/Filter'
   *  Sum: '<S134>/SumD'
   */
  lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_c =
    (lunar_lander_sim_PWPF_2023a_P.PIDController5_D * rtb_Integrator_idx_2 -
     lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE_l) *
    lunar_lander_sim_PWPF_2023a_P.PIDController5_N;

  /* Sum: '<S5>/Sum1' incorporates:
   *  Gain: '<S5>/Gain2'
   *  Gain: '<S96>/Proportional Gain'
   *  Integrator: '<S91>/Integrator'
   *  Sum: '<S100>/Sum'
   */
  lunar_lander_sim_PWPF_2023a_B.Sum1 =
    ((lunar_lander_sim_PWPF_2023a_P.PIDController4_P * rtb_Integrator_idx_1 +
      lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_j) +
     lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_n) *
    lunar_lander_sim_PWPF_2023a_P.Gain2_Gain - rtb_TransferFcn_n;

  /* Sum: '<S6>/Sum1' incorporates:
   *  Gain: '<S144>/Proportional Gain'
   *  Gain: '<S6>/Gain2'
   *  Integrator: '<S139>/Integrator'
   *  Sum: '<S148>/Sum'
   */
  lunar_lander_sim_PWPF_2023a_B.Sum1_l =
    ((lunar_lander_sim_PWPF_2023a_P.PIDController5_P * rtb_Integrator_idx_2 +
      lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_f) +
     lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_c) *
    lunar_lander_sim_PWPF_2023a_P.Gain2_Gain_e - rtb_TransferFcn_c;

  /* Sum: '<S7>/Sum1' incorporates:
   *  Gain: '<S48>/Proportional Gain'
   *  Gain: '<S7>/Gain2'
   *  Integrator: '<S43>/Integrator'
   *  Sum: '<S52>/Sum'
   */
  lunar_lander_sim_PWPF_2023a_B.Sum1_e =
    ((lunar_lander_sim_PWPF_2023a_P.PIDController3_P * rtb_Gain +
      lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE) +
     lunar_lander_sim_PWPF_2023a_B.FilterCoefficient) *
    lunar_lander_sim_PWPF_2023a_P.Gain2_Gain_l - rtb_TransferFcn;
  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* Constant: '<Root>/p q r initial condition' */
    lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[0] =
      lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[0];
    lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[1] =
      lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[1];
    lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[2] =
      lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[2];
  }

  /* Integrator: '<S160>/Integrator' */
  if (lunar_lander_sim_PWPF_2023a_DW.Integrator_IWORK != 0) {
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0] =
      lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[0];
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1] =
      lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[1];
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2] =
      lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[2];
  }

  /* Trigonometry: '<S162>/sincos' incorporates:
   *  Integrator: '<S159>/ '
   */
  rtb_TransferFcn = cos(lunar_lander_sim_PWPF_2023a_X._CSTATE[0]);
  rtb_TransferFcn_n = sin(lunar_lander_sim_PWPF_2023a_X._CSTATE[0]);
  rtb_TransferFcn_c = cos(lunar_lander_sim_PWPF_2023a_X._CSTATE[1]);

  /* Fcn: '<S162>/phidot' incorporates:
   *  Fcn: '<S162>/psidot'
   *  Integrator: '<S160>/Integrator'
   *  Trigonometry: '<S162>/sincos'
   */
  rtb_Gain = rtb_TransferFcn_n *
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1] + rtb_TransferFcn *
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];

  /* SignalConversion generated from: '<S159>/ ' incorporates:
   *  Fcn: '<S162>/phidot'
   *  Fcn: '<S162>/psidot'
   *  Fcn: '<S162>/thetadot'
   *  Integrator: '<S159>/ '
   *  Integrator: '<S160>/Integrator'
   *  Trigonometry: '<S162>/sincos'
   */
  lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[0] = sin
    (lunar_lander_sim_PWPF_2023a_X._CSTATE[1]) / rtb_TransferFcn_c * rtb_Gain +
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0];
  lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[1] =
    rtb_TransferFcn * lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1] -
    rtb_TransferFcn_n * lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];
  lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[2] = rtb_Gain /
    rtb_TransferFcn_c;
  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    for (i = 0; i < 3; i++) {
      /* Concatenate: '<S10>/Vector Concatenate' incorporates:
       *  Constant: '<S10>/I_dot'
       *  Constant: '<S10>/Inertie'
       */
      rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_P.Inertie_Value[3 * i];
      rtb_VectorConcatenate[6 * i] = rtb_TransferFcn;
      rtb_VectorConcatenate[6 * i + 3] =
        lunar_lander_sim_PWPF_2023a_P.I_dot_Value[3 * i];

      /* Selector: '<S160>/Selector' */
      lunar_lander_sim_PWPF_2023a_B.Selector[3 * i] = rtb_TransferFcn;

      /* Concatenate: '<S10>/Vector Concatenate' incorporates:
       *  Constant: '<S10>/I_dot'
       *  Constant: '<S10>/Inertie'
       *  Selector: '<S160>/Selector'
       */
      rtb_VectorConcatenate_tmp = 3 * i + 1;
      rtb_TransferFcn =
        lunar_lander_sim_PWPF_2023a_P.Inertie_Value[rtb_VectorConcatenate_tmp];
      rtb_VectorConcatenate[6 * i + 1] = rtb_TransferFcn;
      rtb_VectorConcatenate[6 * i + 4] =
        lunar_lander_sim_PWPF_2023a_P.I_dot_Value[rtb_VectorConcatenate_tmp];

      /* Selector: '<S160>/Selector' */
      lunar_lander_sim_PWPF_2023a_B.Selector[rtb_VectorConcatenate_tmp] =
        rtb_TransferFcn;

      /* Concatenate: '<S10>/Vector Concatenate' incorporates:
       *  Constant: '<S10>/I_dot'
       *  Constant: '<S10>/Inertie'
       *  Selector: '<S160>/Selector'
       */
      rtb_VectorConcatenate_tmp = 3 * i + 2;
      rtb_TransferFcn =
        lunar_lander_sim_PWPF_2023a_P.Inertie_Value[rtb_VectorConcatenate_tmp];
      rtb_VectorConcatenate[6 * i + 2] = rtb_TransferFcn;
      rtb_VectorConcatenate[6 * i + 5] =
        lunar_lander_sim_PWPF_2023a_P.I_dot_Value[rtb_VectorConcatenate_tmp];

      /* Selector: '<S160>/Selector' */
      lunar_lander_sim_PWPF_2023a_B.Selector[rtb_VectorConcatenate_tmp] =
        rtb_TransferFcn;
    }
  }

  /* Integrator: '<S160>/Integrator' incorporates:
   *  Product: '<S164>/Product'
   */
  rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1];
  rtb_TransferFcn_n = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0];
  rtb_TransferFcn_c = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];
  for (i = 0; i <= 0; i += 2) {
    /* Product: '<S164>/Product' incorporates:
     *  Integrator: '<S160>/Integrator'
     *  Selector: '<S160>/Selector'
     *  Sum: '<S163>/Sum'
     */
    tmp_3 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector[i + 3]);
    tmp_4 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector[i]);
    tmp_5 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector[i + 6]);
    _mm_storeu_pd(&rtb_Sum_lp[i], _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_3,
      _mm_set1_pd(rtb_TransferFcn)), _mm_mul_pd(tmp_4, _mm_set1_pd
      (rtb_TransferFcn_n))), _mm_mul_pd(tmp_5, _mm_set1_pd(rtb_TransferFcn_c))));
  }

  /* Product: '<S164>/Product' */
  for (i = 2; i < 3; i++) {
    /* Sum: '<S163>/Sum' incorporates:
     *  Integrator: '<S160>/Integrator'
     *  Selector: '<S160>/Selector'
     */
    rtb_Sum_lp[i] = (lunar_lander_sim_PWPF_2023a_B.Selector[i + 3] *
                     rtb_TransferFcn + lunar_lander_sim_PWPF_2023a_B.Selector[i]
                     * rtb_TransferFcn_n) +
      lunar_lander_sim_PWPF_2023a_B.Selector[i + 6] * rtb_TransferFcn_c;
  }

  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    for (i = 0; i < 3; i++) {
      /* Selector: '<S160>/Selector1' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector1[3 * i] = rtb_VectorConcatenate[6 *
        i + 3];

      /* Selector: '<S160>/Selector2' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector2[3 * i] = rtb_VectorConcatenate[6 *
        i];

      /* Selector: '<S160>/Selector1' incorporates:
       *  Selector: '<S160>/Selector2'
       */
      rtb_VectorConcatenate_tmp = 3 * i + 1;

      /* Selector: '<S160>/Selector1' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector1[rtb_VectorConcatenate_tmp] =
        rtb_VectorConcatenate[6 * i + 4];

      /* Selector: '<S160>/Selector2' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector2[rtb_VectorConcatenate_tmp] =
        rtb_VectorConcatenate[6 * i + 1];

      /* Selector: '<S160>/Selector1' incorporates:
       *  Selector: '<S160>/Selector2'
       */
      rtb_VectorConcatenate_tmp = 3 * i + 2;

      /* Selector: '<S160>/Selector1' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector1[rtb_VectorConcatenate_tmp] =
        rtb_VectorConcatenate[6 * i + 5];

      /* Selector: '<S160>/Selector2' incorporates:
       *  Concatenate: '<S10>/Vector Concatenate'
       */
      lunar_lander_sim_PWPF_2023a_B.Selector2[rtb_VectorConcatenate_tmp] =
        rtb_VectorConcatenate[6 * i + 2];
    }
  }

  /* Sum: '<S163>/Sum' incorporates:
   *  Integrator: '<S160>/Integrator'
   *  Product: '<S166>/i x j'
   *  Product: '<S166>/j x k'
   *  Product: '<S166>/k x i'
   *  Product: '<S167>/i x k'
   *  Product: '<S167>/j x i'
   *  Product: '<S167>/k x j'
   */
  tmp[0] = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1] * rtb_Sum_lp[2];
  tmp[1] = rtb_Sum_lp[0] * lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];
  tmp[2] = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0] * rtb_Sum_lp[1];
  rtb_Sum_f[0] = rtb_Sum_lp[1] *
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];
  rtb_Sum_f[1] = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0] *
    rtb_Sum_lp[2];
  rtb_Sum_f[2] = rtb_Sum_lp[0] *
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1];

  /* Integrator: '<S160>/Integrator' incorporates:
   *  Product: '<S165>/Product'
   */
  rtb_TransferFcn = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1];
  rtb_TransferFcn_n = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0];
  rtb_TransferFcn_c = lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2];
  for (i = 0; i <= 0; i += 2) {
    /* Product: '<S165>/Product' incorporates:
     *  Selector: '<S160>/Selector1'
     *  Sum: '<S160>/Sum2'
     */
    tmp_3 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector1[i + 3]);
    tmp_4 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector1[i]);
    tmp_5 = _mm_loadu_pd(&lunar_lander_sim_PWPF_2023a_B.Selector1[i + 6]);

    /* Sum: '<S160>/Sum2' */
    tmp_0 = _mm_loadu_pd(&rtb_Divide[i]);

    /* Sum: '<S163>/Sum' incorporates:
     *  Sum: '<S160>/Sum2'
     */
    tmp_1 = _mm_loadu_pd(&tmp[i]);
    tmp_2 = _mm_loadu_pd(&rtb_Sum_f[i]);

    /* Sum: '<S160>/Sum2' incorporates:
     *  Integrator: '<S160>/Integrator'
     */
    _mm_storeu_pd(&rtb_Sum_lp[i], _mm_sub_pd(_mm_sub_pd(tmp_0, _mm_add_pd
      (_mm_add_pd(_mm_mul_pd(tmp_3, _mm_set1_pd(rtb_TransferFcn)), _mm_mul_pd
                  (tmp_4, _mm_set1_pd(rtb_TransferFcn_n))), _mm_mul_pd(tmp_5,
      _mm_set1_pd(rtb_TransferFcn_c)))), _mm_sub_pd(tmp_1, tmp_2)));
  }

  for (i = 2; i < 3; i++) {
    /* Sum: '<S160>/Sum2' incorporates:
     *  Integrator: '<S160>/Integrator'
     *  Product: '<S165>/Product'
     *  Selector: '<S160>/Selector1'
     *  Sum: '<S163>/Sum'
     */
    rtb_Sum_lp[i] = (rtb_Divide[i] - ((lunar_lander_sim_PWPF_2023a_B.Selector1[i
      + 3] * rtb_TransferFcn + lunar_lander_sim_PWPF_2023a_B.Selector1[i] *
      rtb_TransferFcn_n) + lunar_lander_sim_PWPF_2023a_B.Selector1[i + 6] *
      rtb_TransferFcn_c)) - (tmp[i] - rtb_Sum_f[i]);
  }

  /* Product: '<S160>/Product2' incorporates:
   *  Selector: '<S160>/Selector2'
   */
  rt_mrdivide_U1d1x3_U2d_9vOrDY9Z(rtb_Sum_lp,
    lunar_lander_sim_PWPF_2023a_B.Selector2,
    lunar_lander_sim_PWPF_2023a_B.Product2);
  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo,
                        (lunar_lander_sim_PWPF_2023a_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* Update for Integrator: '<S159>/ ' */
    lunar_lander_sim_PWPF_2023a_DW._IWORK = 0;

    /* Update for Integrator: '<S160>/Integrator' */
    lunar_lander_sim_PWPF_2023a_DW.Integrator_IWORK = 0;
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(lunar_lander_sim_PWPF_2023a_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(lunar_lander_sim_PWPF_2023a_M)!=-1) &&
          !((rtmGetTFinal(lunar_lander_sim_PWPF_2023a_M)-
             (((lunar_lander_sim_PWPF_2023a_M->Timing.clockTick1+
                lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH1* 4294967296.0))
              * 0.001)) > (((lunar_lander_sim_PWPF_2023a_M->Timing.clockTick1+
                             lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH1*
                             4294967296.0)) * 0.001) * (DBL_EPSILON))) {
        rtmSetErrorStatus(lunar_lander_sim_PWPF_2023a_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&lunar_lander_sim_PWPF_2023a_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++lunar_lander_sim_PWPF_2023a_M->Timing.clockTick0)) {
      ++lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH0;
    }

    lunar_lander_sim_PWPF_2023a_M->Timing.t[0] = rtsiGetSolverStopTime
      (&lunar_lander_sim_PWPF_2023a_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.001s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.001, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      lunar_lander_sim_PWPF_2023a_M->Timing.clockTick1++;
      if (!lunar_lander_sim_PWPF_2023a_M->Timing.clockTick1) {
        lunar_lander_sim_PWPF_2023a_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void lunar_lander_sim_PWPF_2023a_derivatives(void)
{
  XDot_lunar_lander_sim_PWPF_20_T *_rtXdot;
  _rtXdot = ((XDot_lunar_lander_sim_PWPF_20_T *)
             lunar_lander_sim_PWPF_2023a_M->derivs);

  /* Derivatives for TransferFcn: '<S7>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE = lunar_lander_sim_PWPF_2023a_P.TransferFcn_A *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE;
  _rtXdot->TransferFcn_CSTATE += lunar_lander_sim_PWPF_2023a_B.Sum1_e;

  /* Derivatives for TransferFcn: '<S5>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE_h = lunar_lander_sim_PWPF_2023a_P.TransferFcn_A_e *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_h;
  _rtXdot->TransferFcn_CSTATE_h += lunar_lander_sim_PWPF_2023a_B.Sum1;

  /* Derivatives for TransferFcn: '<S6>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE_hb =
    lunar_lander_sim_PWPF_2023a_P.TransferFcn_A_et *
    lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_hb;
  _rtXdot->TransferFcn_CSTATE_hb += lunar_lander_sim_PWPF_2023a_B.Sum1_l;

  /* Derivatives for Integrator: '<S38>/Filter' */
  _rtXdot->Filter_CSTATE = lunar_lander_sim_PWPF_2023a_B.FilterCoefficient;

  /* Derivatives for Integrator: '<S43>/Integrator' */
  _rtXdot->Integrator_CSTATE = lunar_lander_sim_PWPF_2023a_B.IntegralGain;

  /* Derivatives for Integrator: '<S86>/Filter' */
  _rtXdot->Filter_CSTATE_g = lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_n;

  /* Derivatives for Integrator: '<S91>/Integrator' */
  _rtXdot->Integrator_CSTATE_j = lunar_lander_sim_PWPF_2023a_B.IntegralGain_e;

  /* Derivatives for Integrator: '<S134>/Filter' */
  _rtXdot->Filter_CSTATE_l = lunar_lander_sim_PWPF_2023a_B.FilterCoefficient_c;

  /* Derivatives for Integrator: '<S139>/Integrator' */
  _rtXdot->Integrator_CSTATE_f = lunar_lander_sim_PWPF_2023a_B.IntegralGain_d;

  /* Derivatives for Integrator: '<S159>/ ' */
  _rtXdot->_CSTATE[0] =
    lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[0];

  /* Derivatives for Integrator: '<S160>/Integrator' */
  _rtXdot->Integrator_CSTATE_p[0] = lunar_lander_sim_PWPF_2023a_B.Product2[0];

  /* Derivatives for Integrator: '<S159>/ ' */
  _rtXdot->_CSTATE[1] =
    lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[1];

  /* Derivatives for Integrator: '<S160>/Integrator' */
  _rtXdot->Integrator_CSTATE_p[1] = lunar_lander_sim_PWPF_2023a_B.Product2[1];

  /* Derivatives for Integrator: '<S159>/ ' */
  _rtXdot->_CSTATE[2] =
    lunar_lander_sim_PWPF_2023a_B.TmpSignalConversionAtInport1[2];

  /* Derivatives for Integrator: '<S160>/Integrator' */
  _rtXdot->Integrator_CSTATE_p[2] = lunar_lander_sim_PWPF_2023a_B.Product2[2];
}

/* Model initialize function */
void lunar_lander_sim_PWPF_2023a_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)lunar_lander_sim_PWPF_2023a_M, 0,
                sizeof(RT_MODEL_lunar_lander_sim_PWP_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                          &lunar_lander_sim_PWPF_2023a_M->Timing.simTimeStep);
    rtsiSetTPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo, &rtmGetTPtr
                (lunar_lander_sim_PWPF_2023a_M));
    rtsiSetStepSizePtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                       &lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0);
    rtsiSetdXPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                 &lunar_lander_sim_PWPF_2023a_M->derivs);
    rtsiSetContStatesPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo, (real_T **)
                         &lunar_lander_sim_PWPF_2023a_M->contStates);
    rtsiSetNumContStatesPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
      &lunar_lander_sim_PWPF_2023a_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
      &lunar_lander_sim_PWPF_2023a_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr
      (&lunar_lander_sim_PWPF_2023a_M->solverInfo,
       &lunar_lander_sim_PWPF_2023a_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
      &lunar_lander_sim_PWPF_2023a_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                          (&rtmGetErrorStatus(lunar_lander_sim_PWPF_2023a_M)));
    rtsiSetRTModelPtr(&lunar_lander_sim_PWPF_2023a_M->solverInfo,
                      lunar_lander_sim_PWPF_2023a_M);
  }

  rtsiSetSimTimeStep(&lunar_lander_sim_PWPF_2023a_M->solverInfo, MAJOR_TIME_STEP);
  lunar_lander_sim_PWPF_2023a_M->intgData.y =
    lunar_lander_sim_PWPF_2023a_M->odeY;
  lunar_lander_sim_PWPF_2023a_M->intgData.f[0] =
    lunar_lander_sim_PWPF_2023a_M->odeF[0];
  lunar_lander_sim_PWPF_2023a_M->intgData.f[1] =
    lunar_lander_sim_PWPF_2023a_M->odeF[1];
  lunar_lander_sim_PWPF_2023a_M->intgData.f[2] =
    lunar_lander_sim_PWPF_2023a_M->odeF[2];
  lunar_lander_sim_PWPF_2023a_M->contStates = ((X_lunar_lander_sim_PWPF_2023a_T *)
    &lunar_lander_sim_PWPF_2023a_X);
  rtsiSetSolverData(&lunar_lander_sim_PWPF_2023a_M->solverInfo, (void *)
                    &lunar_lander_sim_PWPF_2023a_M->intgData);
  rtsiSetIsMinorTimeStepWithModeChange
    (&lunar_lander_sim_PWPF_2023a_M->solverInfo, false);
  rtsiSetSolverName(&lunar_lander_sim_PWPF_2023a_M->solverInfo,"ode3");
  rtmSetTPtr(lunar_lander_sim_PWPF_2023a_M,
             &lunar_lander_sim_PWPF_2023a_M->Timing.tArray[0]);
  rtmSetTFinal(lunar_lander_sim_PWPF_2023a_M, 250.0);
  lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0 = 0.001;
  rtmSetFirstInitCond(lunar_lander_sim_PWPF_2023a_M, 1);

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = (NULL);
    lunar_lander_sim_PWPF_2023a_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, (NULL));
    rtliSetLogT(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, "tout");
    rtliSetLogX(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, "");
    rtliSetLogXFinal(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, 0);
    rtliSetLogDecimation(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, 1);
    rtliSetLogY(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &lunar_lander_sim_PWPF_2023a_B), 0,
                sizeof(B_lunar_lander_sim_PWPF_2023a_T));

  /* states (continuous) */
  {
    (void) memset((void *)&lunar_lander_sim_PWPF_2023a_X, 0,
                  sizeof(X_lunar_lander_sim_PWPF_2023a_T));
  }

  /* states (dwork) */
  (void) memset((void *)&lunar_lander_sim_PWPF_2023a_DW, 0,
                sizeof(DW_lunar_lander_sim_PWPF_2023_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(lunar_lander_sim_PWPF_2023a_M->rtwLogInfo,
    0.0, rtmGetTFinal(lunar_lander_sim_PWPF_2023a_M),
    lunar_lander_sim_PWPF_2023a_M->Timing.stepSize0, (&rtmGetErrorStatus
    (lunar_lander_sim_PWPF_2023a_M)));

  /* Start for Constant: '<Root>/p q r initial condition' */
  lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[0] =
    lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[0];
  lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[1] =
    lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[1];
  lunar_lander_sim_PWPF_2023a_B.pqrinitialcondition[2] =
    lunar_lander_sim_PWPF_2023a_P.pqrinitialcondition_Value[2];

  /* InitializeConditions for TransferFcn: '<S7>/Transfer Fcn' */
  lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S5>/Transfer Fcn' */
  lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_h = 0.0;

  /* InitializeConditions for TransferFcn: '<S6>/Transfer Fcn' */
  lunar_lander_sim_PWPF_2023a_X.TransferFcn_CSTATE_hb = 0.0;

  /* InitializeConditions for Integrator: '<S159>/ ' incorporates:
   *  Integrator: '<S160>/Integrator'
   */
  if (rtmIsFirstInitCond(lunar_lander_sim_PWPF_2023a_M)) {
    lunar_lander_sim_PWPF_2023a_X._CSTATE[0] = 0.0;
    lunar_lander_sim_PWPF_2023a_X._CSTATE[1] = 0.0;
    lunar_lander_sim_PWPF_2023a_X._CSTATE[2] = 0.0;
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[0] = 0.0;
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[1] = 0.0;
    lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_p[2] = 0.0;
  }

  lunar_lander_sim_PWPF_2023a_DW._IWORK = 1;

  /* End of InitializeConditions for Integrator: '<S159>/ ' */

  /* InitializeConditions for Integrator: '<S38>/Filter' */
  lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE =
    lunar_lander_sim_PWPF_2023a_P.PIDController3_InitialCondition;

  /* InitializeConditions for Integrator: '<S43>/Integrator' */
  lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE =
    lunar_lander_sim_PWPF_2023a_P.PIDController3_InitialConditi_f;

  /* InitializeConditions for Integrator: '<S86>/Filter' */
  lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE_g =
    lunar_lander_sim_PWPF_2023a_P.PIDController4_InitialCondition;

  /* InitializeConditions for Integrator: '<S91>/Integrator' */
  lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_j =
    lunar_lander_sim_PWPF_2023a_P.PIDController4_InitialConditi_l;

  /* InitializeConditions for Integrator: '<S134>/Filter' */
  lunar_lander_sim_PWPF_2023a_X.Filter_CSTATE_l =
    lunar_lander_sim_PWPF_2023a_P.PIDController5_InitialCondition;

  /* InitializeConditions for Integrator: '<S139>/Integrator' */
  lunar_lander_sim_PWPF_2023a_X.Integrator_CSTATE_f =
    lunar_lander_sim_PWPF_2023a_P.PIDController5_InitialConditi_l;

  /* InitializeConditions for Integrator: '<S160>/Integrator' */
  lunar_lander_sim_PWPF_2023a_DW.Integrator_IWORK = 1;

  /* set "at time zero" to false */
  if (rtmIsFirstInitCond(lunar_lander_sim_PWPF_2023a_M)) {
    rtmSetFirstInitCond(lunar_lander_sim_PWPF_2023a_M, 0);
  }
}

/* Model terminate function */
void lunar_lander_sim_PWPF_2023a_terminate(void)
{
  /* (no terminate code required) */
}
