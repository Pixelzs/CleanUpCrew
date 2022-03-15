/// @description Insert description here
// You can write your code in this editor

var target = rmZ1L1;

if (room == rmZ1L1) target = rmZ1L2;
if (room == rmZ1L2) target = rmZ1L3;
if (room == rmZ1L3) target = rmZ1L4;
if (room == rmZ1L4) target = rmZ1L5;

if (room == rmZ1L5) target = rmZ2L1;
if (room == rmZ2L1) target = rmZ2L2;
if (room == rmZ2L2) target = rmZ2L3;
if (room == rmZ2L3) target = rmZ2L4;
if (room == rmZ2L4) target = rmZ2L5;

if (room == rmZ2L5) target = rmZ3L1;
if (room == rmZ3L1) target = rmZ3L2;
if (room == rmZ3L2) target = rmZ3L3;
if (room == rmZ3L3) target = rmZ3L4;
if (room == rmZ3L4) target = rmZ3L5;

if (room == rmZ3L5) target = rmZ4L1;
if (room == rmZ4L1) target = rmZ4L2;
if (room == rmZ4L2) target = rmZ4L3;
if (room == rmZ4L3) target = rmZ4L4;
if (room == rmZ4L4) target = rmZ4L5;

if (room == rmZ4L5) target = rmZ5L1;
if (room == rmZ5L1) target = rmZ5L2;
if (room == rmZ5L2) target = rmZ5L3;
if (room == rmZ5L3) target = rmZ5L4;
if (room == rmZ5L4) target = rmZ5L5;

if (room == rmZ5L5) target = MainMenu;

TransitionStart(target,Transition_FadeOut,Transition_FadeIn);

