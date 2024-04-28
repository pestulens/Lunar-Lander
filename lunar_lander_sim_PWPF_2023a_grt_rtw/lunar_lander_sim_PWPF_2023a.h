/*
 * lunar_lander_sim_PWPF_2023a.h
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

#ifndef RTW_HEADER_lunar_lander_sim_PWPF_2023a_h_
#define RTW_HEADER_lunar_lander_sim_PWPF_2023a_h_
#ifndef lunar_lander_sim_PWPF_2023a_COMMON_INCLUDES_
#define lunar_lander_sim_PWPF_2023a_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                        /* lunar_lander_sim_PWPF_2023a_COMMON_INCLUDES_ */

#include "lunar_lander_sim_PWPF_2023a_types.h"
#include <float.h>
#include <string.h>
#include <stddef.h>
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContStateDisabled
#define rtmGetContStateDisabled(rtm)   ((rtm)->contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
#define rtmSetContStateDisabled(rtm, val) ((rtm)->contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
#define rtmGetContStates(rtm)          ((rtm)->contStates)
#endif

#ifndef rtmSetContStates
#define rtmSetContStates(rtm, val)     ((rtm)->contStates = (val))
#endif

#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
#define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
#define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
#define rtmGetIntgData(rtm)            ((rtm)->intgData)
#endif

#ifndef rtmSetIntgData
#define rtmSetIntgData(rtm, val)       ((rtm)->intgData = (val))
#endif

#ifndef rtmGetOdeF
#define rtmGetOdeF(rtm)                ((rtm)->odeF)
#endif

#ifndef rtmSetOdeF
#define rtmSetOdeF(rtm, val)           ((rtm)->odeF = (val))
#endif

#ifndef rtmGetOdeY
#define rtmGetOdeY(rtm)                ((rtm)->odeY)
#endif

#ifndef rtmSetOdeY
#define rtmSetOdeY(rtm, val)           ((rtm)->odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
#define rtmGetPeriodicContStateIndices(rtm) ((rtm)->periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
#define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
#define rtmGetPeriodicContStateRanges(rtm) ((rtm)->periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
#define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWLogInfo
#define rtmGetRTWLogInfo(rtm)          ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
#define rtmGetZCCacheNeedsReset(rtm)   ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
#define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
#define rtmGetdX(rtm)                  ((rtm)->derivs)
#endif

#ifndef rtmSetdX
#define rtmSetdX(rtm, val)             ((rtm)->derivs = (val))
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T Relay;                        /* '<S158>/Relay' */
  real_T Relay1;                       /* '<S158>/Relay1' */
  real_T Relay_c;                      /* '<S156>/Relay' */
  real_T Relay1_j;                     /* '<S156>/Relay1' */
  real_T Relay_j;                      /* '<S157>/Relay' */
  real_T Relay1_e;                     /* '<S157>/Relay1' */
  real_T Gain1[3];                     /* '<S1>/Gain1' */
  real_T Gain1_o[3];                   /* '<S161>/Gain1' */
  real_T IntegralGain;                 /* '<S40>/Integral Gain' */
  real_T FilterCoefficient;            /* '<S46>/Filter Coefficient' */
  real_T IntegralGain_e;               /* '<S88>/Integral Gain' */
  real_T FilterCoefficient_n;          /* '<S94>/Filter Coefficient' */
  real_T IntegralGain_d;               /* '<S136>/Integral Gain' */
  real_T FilterCoefficient_c;          /* '<S142>/Filter Coefficient' */
  real_T Sum1;                         /* '<S5>/Sum1' */
  real_T Sum1_l;                       /* '<S6>/Sum1' */
  real_T Sum1_e;                       /* '<S7>/Sum1' */
  real_T pqrinitialcondition[3];       /* '<Root>/p q r initial condition' */
  real_T TmpSignalConversionAtInport1[3];/* '<S159>/phidot thetadot psidot' */
  real_T Selector[9];                  /* '<S160>/Selector' */
  real_T Selector1[9];                 /* '<S160>/Selector1' */
  real_T Selector2[9];                 /* '<S160>/Selector2' */
  real_T Product2[3];                  /* '<S160>/Product2' */
} B_lunar_lander_sim_PWPF_2023a_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Product2_DWORK4[9];           /* '<S160>/Product2' */
  int_T _IWORK;                        /* '<S159>/ ' */
  int_T Integrator_IWORK;              /* '<S160>/Integrator' */
  boolean_T Relay_Mode;                /* '<S158>/Relay' */
  boolean_T Relay1_Mode;               /* '<S158>/Relay1' */
  boolean_T Relay_Mode_a;              /* '<S156>/Relay' */
  boolean_T Relay1_Mode_d;             /* '<S156>/Relay1' */
  boolean_T Relay_Mode_l;              /* '<S157>/Relay' */
  boolean_T Relay1_Mode_n;             /* '<S157>/Relay1' */
} DW_lunar_lander_sim_PWPF_2023_T;

/* Continuous states (default storage) */
typedef struct {
  real_T TransferFcn_CSTATE;           /* '<S7>/Transfer Fcn' */
  real_T TransferFcn_CSTATE_h;         /* '<S5>/Transfer Fcn' */
  real_T TransferFcn_CSTATE_hb;        /* '<S6>/Transfer Fcn' */
  real_T _CSTATE[3];                   /* '<S159>/ ' */
  real_T Filter_CSTATE;                /* '<S38>/Filter' */
  real_T Integrator_CSTATE;            /* '<S43>/Integrator' */
  real_T Filter_CSTATE_g;              /* '<S86>/Filter' */
  real_T Integrator_CSTATE_j;          /* '<S91>/Integrator' */
  real_T Filter_CSTATE_l;              /* '<S134>/Filter' */
  real_T Integrator_CSTATE_f;          /* '<S139>/Integrator' */
  real_T Integrator_CSTATE_p[3];       /* '<S160>/Integrator' */
} X_lunar_lander_sim_PWPF_2023a_T;

/* State derivatives (default storage) */
typedef struct {
  real_T TransferFcn_CSTATE;           /* '<S7>/Transfer Fcn' */
  real_T TransferFcn_CSTATE_h;         /* '<S5>/Transfer Fcn' */
  real_T TransferFcn_CSTATE_hb;        /* '<S6>/Transfer Fcn' */
  real_T _CSTATE[3];                   /* '<S159>/ ' */
  real_T Filter_CSTATE;                /* '<S38>/Filter' */
  real_T Integrator_CSTATE;            /* '<S43>/Integrator' */
  real_T Filter_CSTATE_g;              /* '<S86>/Filter' */
  real_T Integrator_CSTATE_j;          /* '<S91>/Integrator' */
  real_T Filter_CSTATE_l;              /* '<S134>/Filter' */
  real_T Integrator_CSTATE_f;          /* '<S139>/Integrator' */
  real_T Integrator_CSTATE_p[3];       /* '<S160>/Integrator' */
} XDot_lunar_lander_sim_PWPF_20_T;

/* State disabled  */
typedef struct {
  boolean_T TransferFcn_CSTATE;        /* '<S7>/Transfer Fcn' */
  boolean_T TransferFcn_CSTATE_h;      /* '<S5>/Transfer Fcn' */
  boolean_T TransferFcn_CSTATE_hb;     /* '<S6>/Transfer Fcn' */
  boolean_T _CSTATE[3];                /* '<S159>/ ' */
  boolean_T Filter_CSTATE;             /* '<S38>/Filter' */
  boolean_T Integrator_CSTATE;         /* '<S43>/Integrator' */
  boolean_T Filter_CSTATE_g;           /* '<S86>/Filter' */
  boolean_T Integrator_CSTATE_j;       /* '<S91>/Integrator' */
  boolean_T Filter_CSTATE_l;           /* '<S134>/Filter' */
  boolean_T Integrator_CSTATE_f;       /* '<S139>/Integrator' */
  boolean_T Integrator_CSTATE_p[3];    /* '<S160>/Integrator' */
} XDis_lunar_lander_sim_PWPF_20_T;

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
} ODE3_IntgData;

#endif

/* Parameters (default storage) */
struct P_lunar_lander_sim_PWPF_2023a_T_ {
  real_T PIDController3_D;             /* Mask Parameter: PIDController3_D
                                        * Referenced by: '<S37>/Derivative Gain'
                                        */
  real_T PIDController4_D;             /* Mask Parameter: PIDController4_D
                                        * Referenced by: '<S85>/Derivative Gain'
                                        */
  real_T PIDController5_D;             /* Mask Parameter: PIDController5_D
                                        * Referenced by: '<S133>/Derivative Gain'
                                        */
  real_T PIDController3_I;             /* Mask Parameter: PIDController3_I
                                        * Referenced by: '<S40>/Integral Gain'
                                        */
  real_T PIDController4_I;             /* Mask Parameter: PIDController4_I
                                        * Referenced by: '<S88>/Integral Gain'
                                        */
  real_T PIDController5_I;             /* Mask Parameter: PIDController5_I
                                        * Referenced by: '<S136>/Integral Gain'
                                        */
  real_T PIDController3_InitialCondition;
                              /* Mask Parameter: PIDController3_InitialCondition
                               * Referenced by: '<S38>/Filter'
                               */
  real_T PIDController4_InitialCondition;
                              /* Mask Parameter: PIDController4_InitialCondition
                               * Referenced by: '<S86>/Filter'
                               */
  real_T PIDController5_InitialCondition;
                              /* Mask Parameter: PIDController5_InitialCondition
                               * Referenced by: '<S134>/Filter'
                               */
  real_T PIDController3_InitialConditi_f;
                              /* Mask Parameter: PIDController3_InitialConditi_f
                               * Referenced by: '<S43>/Integrator'
                               */
  real_T PIDController4_InitialConditi_l;
                              /* Mask Parameter: PIDController4_InitialConditi_l
                               * Referenced by: '<S91>/Integrator'
                               */
  real_T PIDController5_InitialConditi_l;
                              /* Mask Parameter: PIDController5_InitialConditi_l
                               * Referenced by: '<S139>/Integrator'
                               */
  real_T PIDController3_N;             /* Mask Parameter: PIDController3_N
                                        * Referenced by: '<S46>/Filter Coefficient'
                                        */
  real_T PIDController4_N;             /* Mask Parameter: PIDController4_N
                                        * Referenced by: '<S94>/Filter Coefficient'
                                        */
  real_T PIDController5_N;             /* Mask Parameter: PIDController5_N
                                        * Referenced by: '<S142>/Filter Coefficient'
                                        */
  real_T PIDController3_P;             /* Mask Parameter: PIDController3_P
                                        * Referenced by: '<S48>/Proportional Gain'
                                        */
  real_T PIDController4_P;             /* Mask Parameter: PIDController4_P
                                        * Referenced by: '<S96>/Proportional Gain'
                                        */
  real_T PIDController5_P;             /* Mask Parameter: PIDController5_P
                                        * Referenced by: '<S144>/Proportional Gain'
                                        */
  real_T phithetapsiinitialcondition_Val[3];/* Expression: [0;0;0]
                                             * Referenced by: '<Root>/ phi theta psi initial condition'
                                             */
  real_T TransferFcn_A;                /* Computed Parameter: TransferFcn_A
                                        * Referenced by: '<S7>/Transfer Fcn'
                                        */
  real_T TransferFcn_C;                /* Computed Parameter: TransferFcn_C
                                        * Referenced by: '<S7>/Transfer Fcn'
                                        */
  real_T Relay_OnVal;                  /* Expression: 0.5
                                        * Referenced by: '<S158>/Relay'
                                        */
  real_T Relay_OffVal;                 /* Expression: 0.15
                                        * Referenced by: '<S158>/Relay'
                                        */
  real_T Relay_YOn;                    /* Expression: 4.5
                                        * Referenced by: '<S158>/Relay'
                                        */
  real_T Relay_YOff;                   /* Expression: 0
                                        * Referenced by: '<S158>/Relay'
                                        */
  real_T Gain_Gain;                    /* Expression: -1
                                        * Referenced by: '<S158>/Gain'
                                        */
  real_T Relay1_OnVal;                 /* Expression: 0.5
                                        * Referenced by: '<S158>/Relay1'
                                        */
  real_T Relay1_OffVal;                /* Expression: 0.15
                                        * Referenced by: '<S158>/Relay1'
                                        */
  real_T Relay1_YOn;                   /* Expression: -4.5
                                        * Referenced by: '<S158>/Relay1'
                                        */
  real_T Relay1_YOff;                  /* Expression: 0
                                        * Referenced by: '<S158>/Relay1'
                                        */
  real_T Switch_Threshold;             /* Expression: 0
                                        * Referenced by: '<S158>/Switch'
                                        */
  real_T TransferFcn_A_e;              /* Computed Parameter: TransferFcn_A_e
                                        * Referenced by: '<S5>/Transfer Fcn'
                                        */
  real_T TransferFcn_C_o;              /* Computed Parameter: TransferFcn_C_o
                                        * Referenced by: '<S5>/Transfer Fcn'
                                        */
  real_T Relay_OnVal_p;                /* Expression: 0.5
                                        * Referenced by: '<S156>/Relay'
                                        */
  real_T Relay_OffVal_f;               /* Expression: 0.15
                                        * Referenced by: '<S156>/Relay'
                                        */
  real_T Relay_YOn_m;                  /* Expression: 4.5
                                        * Referenced by: '<S156>/Relay'
                                        */
  real_T Relay_YOff_d;                 /* Expression: 0
                                        * Referenced by: '<S156>/Relay'
                                        */
  real_T Gain_Gain_d;                  /* Expression: -1
                                        * Referenced by: '<S156>/Gain'
                                        */
  real_T Relay1_OnVal_g;               /* Expression: 0.5
                                        * Referenced by: '<S156>/Relay1'
                                        */
  real_T Relay1_OffVal_e;              /* Expression: 0.15
                                        * Referenced by: '<S156>/Relay1'
                                        */
  real_T Relay1_YOn_i;                 /* Expression: -4.5
                                        * Referenced by: '<S156>/Relay1'
                                        */
  real_T Relay1_YOff_c;                /* Expression: 0
                                        * Referenced by: '<S156>/Relay1'
                                        */
  real_T Switch_Threshold_o;           /* Expression: 0
                                        * Referenced by: '<S156>/Switch'
                                        */
  real_T TransferFcn_A_et;             /* Computed Parameter: TransferFcn_A_et
                                        * Referenced by: '<S6>/Transfer Fcn'
                                        */
  real_T TransferFcn_C_m;              /* Computed Parameter: TransferFcn_C_m
                                        * Referenced by: '<S6>/Transfer Fcn'
                                        */
  real_T Relay_OnVal_b;                /* Expression: 0.5
                                        * Referenced by: '<S157>/Relay'
                                        */
  real_T Relay_OffVal_n;               /* Expression: 0.15
                                        * Referenced by: '<S157>/Relay'
                                        */
  real_T Relay_YOn_i;                  /* Expression: 4.5
                                        * Referenced by: '<S157>/Relay'
                                        */
  real_T Relay_YOff_g;                 /* Expression: 0
                                        * Referenced by: '<S157>/Relay'
                                        */
  real_T Gain_Gain_j;                  /* Expression: -1
                                        * Referenced by: '<S157>/Gain'
                                        */
  real_T Relay1_OnVal_b;               /* Expression: 0.5
                                        * Referenced by: '<S157>/Relay1'
                                        */
  real_T Relay1_OffVal_n;              /* Expression: 0.15
                                        * Referenced by: '<S157>/Relay1'
                                        */
  real_T Relay1_YOn_i5;                /* Expression: -4.5
                                        * Referenced by: '<S157>/Relay1'
                                        */
  real_T Relay1_YOff_j;                /* Expression: 0
                                        * Referenced by: '<S157>/Relay1'
                                        */
  real_T Switch_Threshold_j;           /* Expression: 0
                                        * Referenced by: '<S157>/Switch'
                                        */
  real_T Constant1_Value;              /* Expression: 0.3
                                        * Referenced by: '<Root>/Constant1'
                                        */
  real_T phithetapsicommand1_Value[3]; /* Expression: [30;20;0]
                                        * Referenced by: '<Root>/phi theta psi command1'
                                        */
  real_T Gain1_Gain;                   /* Expression: pi/180
                                        * Referenced by: '<S1>/Gain1'
                                        */
  real_T Gain1_Gain_m;                 /* Expression: pi/180
                                        * Referenced by: '<S161>/Gain1'
                                        */
  real_T Gain2_Gain;                   /* Expression: 0.8
                                        * Referenced by: '<S5>/Gain2'
                                        */
  real_T Gain2_Gain_e;                 /* Expression: 0.8
                                        * Referenced by: '<S6>/Gain2'
                                        */
  real_T Gain2_Gain_l;                 /* Expression: 0.8
                                        * Referenced by: '<S7>/Gain2'
                                        */
  real_T pqrinitialcondition_Value[3]; /* Expression: [0;0;0]
                                        * Referenced by: '<Root>/p q r initial condition'
                                        */
  real_T Inertie_Value[9];
                        /* Expression: [0.619 -0.008 0;-0.008 0.782 0;0 0 1.226]
                         * Referenced by: '<S10>/Inertie'
                         */
  real_T I_dot_Value[9];               /* Expression: zeros(3)
                                        * Referenced by: '<S10>/I_dot'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_lunar_lander_sim_PWPF_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;
  X_lunar_lander_sim_PWPF_2023a_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  XDis_lunar_lander_sim_PWPF_20_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeY[15];
  real_T odeF[3][15];
  ODE3_IntgData intgData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    boolean_T firstInitCondFlag;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (default storage) */
extern P_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_P;

/* Block signals (default storage) */
extern B_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_B;

/* Continuous states (default storage) */
extern X_lunar_lander_sim_PWPF_2023a_T lunar_lander_sim_PWPF_2023a_X;

/* Block states (default storage) */
extern DW_lunar_lander_sim_PWPF_2023_T lunar_lander_sim_PWPF_2023a_DW;

/* Model entry point functions */
extern void lunar_lander_sim_PWPF_2023a_initialize(void);
extern void lunar_lander_sim_PWPF_2023a_step(void);
extern void lunar_lander_sim_PWPF_2023a_terminate(void);

/* Real-time Model object */
extern RT_MODEL_lunar_lander_sim_PWP_T *const lunar_lander_sim_PWPF_2023a_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'lunar_lander_sim_PWPF_2023a'
 * '<S1>'   : 'lunar_lander_sim_PWPF_2023a/Degrees to Radians1'
 * '<S2>'   : 'lunar_lander_sim_PWPF_2023a/PID Controller3'
 * '<S3>'   : 'lunar_lander_sim_PWPF_2023a/PID Controller4'
 * '<S4>'   : 'lunar_lander_sim_PWPF_2023a/PID Controller5'
 * '<S5>'   : 'lunar_lander_sim_PWPF_2023a/PWPF3'
 * '<S6>'   : 'lunar_lander_sim_PWPF_2023a/PWPF4'
 * '<S7>'   : 'lunar_lander_sim_PWPF_2023a/PWPF5'
 * '<S8>'   : 'lunar_lander_sim_PWPF_2023a/Radians to Degrees2'
 * '<S9>'   : 'lunar_lander_sim_PWPF_2023a/Radians to Degrees3'
 * '<S10>'  : 'lunar_lander_sim_PWPF_2023a/Subsystem1'
 * '<S11>'  : 'lunar_lander_sim_PWPF_2023a/transformation matrix'
 * '<S12>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Anti-windup'
 * '<S13>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/D Gain'
 * '<S14>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Filter'
 * '<S15>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Filter ICs'
 * '<S16>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/I Gain'
 * '<S17>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Ideal P Gain'
 * '<S18>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Ideal P Gain Fdbk'
 * '<S19>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Integrator'
 * '<S20>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Integrator ICs'
 * '<S21>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/N Copy'
 * '<S22>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/N Gain'
 * '<S23>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/P Copy'
 * '<S24>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Parallel P Gain'
 * '<S25>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Reset Signal'
 * '<S26>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Saturation'
 * '<S27>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Saturation Fdbk'
 * '<S28>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Sum'
 * '<S29>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Sum Fdbk'
 * '<S30>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tracking Mode'
 * '<S31>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tracking Mode Sum'
 * '<S32>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tsamp - Integral'
 * '<S33>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tsamp - Ngain'
 * '<S34>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/postSat Signal'
 * '<S35>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/preSat Signal'
 * '<S36>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Anti-windup/Passthrough'
 * '<S37>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/D Gain/Internal Parameters'
 * '<S38>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Filter/Cont. Filter'
 * '<S39>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Filter ICs/Internal IC - Filter'
 * '<S40>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/I Gain/Internal Parameters'
 * '<S41>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Ideal P Gain/Passthrough'
 * '<S42>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Ideal P Gain Fdbk/Disabled'
 * '<S43>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Integrator/Continuous'
 * '<S44>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Integrator ICs/Internal IC'
 * '<S45>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/N Copy/Disabled'
 * '<S46>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/N Gain/Internal Parameters'
 * '<S47>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/P Copy/Disabled'
 * '<S48>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Parallel P Gain/Internal Parameters'
 * '<S49>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Reset Signal/Disabled'
 * '<S50>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Saturation/Passthrough'
 * '<S51>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Saturation Fdbk/Disabled'
 * '<S52>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Sum/Sum_PID'
 * '<S53>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Sum Fdbk/Disabled'
 * '<S54>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tracking Mode/Disabled'
 * '<S55>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tracking Mode Sum/Passthrough'
 * '<S56>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tsamp - Integral/TsSignalSpecification'
 * '<S57>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/Tsamp - Ngain/Passthrough'
 * '<S58>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/postSat Signal/Forward_Path'
 * '<S59>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller3/preSat Signal/Forward_Path'
 * '<S60>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Anti-windup'
 * '<S61>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/D Gain'
 * '<S62>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Filter'
 * '<S63>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Filter ICs'
 * '<S64>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/I Gain'
 * '<S65>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Ideal P Gain'
 * '<S66>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Ideal P Gain Fdbk'
 * '<S67>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Integrator'
 * '<S68>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Integrator ICs'
 * '<S69>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/N Copy'
 * '<S70>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/N Gain'
 * '<S71>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/P Copy'
 * '<S72>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Parallel P Gain'
 * '<S73>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Reset Signal'
 * '<S74>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Saturation'
 * '<S75>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Saturation Fdbk'
 * '<S76>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Sum'
 * '<S77>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Sum Fdbk'
 * '<S78>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tracking Mode'
 * '<S79>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tracking Mode Sum'
 * '<S80>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tsamp - Integral'
 * '<S81>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tsamp - Ngain'
 * '<S82>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/postSat Signal'
 * '<S83>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/preSat Signal'
 * '<S84>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Anti-windup/Passthrough'
 * '<S85>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/D Gain/Internal Parameters'
 * '<S86>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Filter/Cont. Filter'
 * '<S87>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Filter ICs/Internal IC - Filter'
 * '<S88>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/I Gain/Internal Parameters'
 * '<S89>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Ideal P Gain/Passthrough'
 * '<S90>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Ideal P Gain Fdbk/Disabled'
 * '<S91>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Integrator/Continuous'
 * '<S92>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Integrator ICs/Internal IC'
 * '<S93>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/N Copy/Disabled'
 * '<S94>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/N Gain/Internal Parameters'
 * '<S95>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/P Copy/Disabled'
 * '<S96>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Parallel P Gain/Internal Parameters'
 * '<S97>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Reset Signal/Disabled'
 * '<S98>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Saturation/Passthrough'
 * '<S99>'  : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Saturation Fdbk/Disabled'
 * '<S100>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Sum/Sum_PID'
 * '<S101>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Sum Fdbk/Disabled'
 * '<S102>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tracking Mode/Disabled'
 * '<S103>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tracking Mode Sum/Passthrough'
 * '<S104>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tsamp - Integral/TsSignalSpecification'
 * '<S105>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/Tsamp - Ngain/Passthrough'
 * '<S106>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/postSat Signal/Forward_Path'
 * '<S107>' : 'lunar_lander_sim_PWPF_2023a/PID Controller4/preSat Signal/Forward_Path'
 * '<S108>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Anti-windup'
 * '<S109>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/D Gain'
 * '<S110>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Filter'
 * '<S111>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Filter ICs'
 * '<S112>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/I Gain'
 * '<S113>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Ideal P Gain'
 * '<S114>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Ideal P Gain Fdbk'
 * '<S115>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Integrator'
 * '<S116>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Integrator ICs'
 * '<S117>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/N Copy'
 * '<S118>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/N Gain'
 * '<S119>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/P Copy'
 * '<S120>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Parallel P Gain'
 * '<S121>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Reset Signal'
 * '<S122>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Saturation'
 * '<S123>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Saturation Fdbk'
 * '<S124>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Sum'
 * '<S125>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Sum Fdbk'
 * '<S126>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tracking Mode'
 * '<S127>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tracking Mode Sum'
 * '<S128>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tsamp - Integral'
 * '<S129>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tsamp - Ngain'
 * '<S130>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/postSat Signal'
 * '<S131>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/preSat Signal'
 * '<S132>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Anti-windup/Passthrough'
 * '<S133>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/D Gain/Internal Parameters'
 * '<S134>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Filter/Cont. Filter'
 * '<S135>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Filter ICs/Internal IC - Filter'
 * '<S136>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/I Gain/Internal Parameters'
 * '<S137>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Ideal P Gain/Passthrough'
 * '<S138>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Ideal P Gain Fdbk/Disabled'
 * '<S139>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Integrator/Continuous'
 * '<S140>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Integrator ICs/Internal IC'
 * '<S141>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/N Copy/Disabled'
 * '<S142>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/N Gain/Internal Parameters'
 * '<S143>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/P Copy/Disabled'
 * '<S144>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Parallel P Gain/Internal Parameters'
 * '<S145>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Reset Signal/Disabled'
 * '<S146>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Saturation/Passthrough'
 * '<S147>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Saturation Fdbk/Disabled'
 * '<S148>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Sum/Sum_PID'
 * '<S149>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Sum Fdbk/Disabled'
 * '<S150>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tracking Mode/Disabled'
 * '<S151>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tracking Mode Sum/Passthrough'
 * '<S152>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tsamp - Integral/TsSignalSpecification'
 * '<S153>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/Tsamp - Ngain/Passthrough'
 * '<S154>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/postSat Signal/Forward_Path'
 * '<S155>' : 'lunar_lander_sim_PWPF_2023a/PID Controller5/preSat Signal/Forward_Path'
 * '<S156>' : 'lunar_lander_sim_PWPF_2023a/PWPF3/schimitt trigger'
 * '<S157>' : 'lunar_lander_sim_PWPF_2023a/PWPF4/schimitt trigger'
 * '<S158>' : 'lunar_lander_sim_PWPF_2023a/PWPF5/schimitt trigger'
 * '<S159>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate Attitude '
 * '<S160>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot'
 * '<S161>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Degrees to Radians'
 * '<S162>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate Attitude /phidot thetadot psidot'
 * '<S163>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot/3x3 Cross Product'
 * '<S164>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot/I x w'
 * '<S165>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot/I x w1'
 * '<S166>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot/3x3 Cross Product/Subsystem'
 * '<S167>' : 'lunar_lander_sim_PWPF_2023a/Subsystem1/Calculate omega_dot/3x3 Cross Product/Subsystem1'
 */
#endif                           /* RTW_HEADER_lunar_lander_sim_PWPF_2023a_h_ */
