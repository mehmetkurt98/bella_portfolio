import 'package:flutter/material.dart';

abstract final class LoginProjectData {
  static const title = 'Login & Registration';
  static const subtitle = 'Removing friction from the first step';
  static const category = 'UX / UI CASE STUDY';
  static const scope = 'Account creation · Sign in · Verification';

  static const cream = Color(0xFFFCFBF9);
  static const warm = Color(0xFFF0EFE9);
  static const yellow = Color(0xFFE9E241);
  static const ink = Color(0xFF171717);
  static const muted = Color(0xFF66635E);
  static const line = Color(0xFFD7D3CB);

  static const registerAsset = 'assets/projects/login/register.webp';
  static const loginAsset = 'assets/projects/login/login.webp';
  static const verifyAsset = 'assets/projects/login/verify.webp';
  static const successAsset = 'assets/projects/login/success.webp';
  static const handLoginAsset = 'assets/projects/login/hand-login.webp';
  static const handVerifyAsset = 'assets/projects/login/hand-verify.webp';

  static const frictionPoints = <LoginContentItem>[
    LoginContentItem(
      number: '01',
      title: 'Long registration',
      body:
          'Address and preference fields increased effort before users could browse.',
    ),
    LoginContentItem(
      number: '02',
      title: 'Unclear value',
      body:
          'The experience needed to explain why creating an account was worth the time.',
    ),
    LoginContentItem(
      number: '03',
      title: 'Trust at a sensitive moment',
      body:
          'Password, personal data and verification required clear feedback and control.',
    ),
  ];

  static const flowSteps = <LoginContentItem>[
    LoginContentItem(
      number: '01',
      title: 'Choose',
      body: 'Log in, register or continue as guest',
    ),
    LoginContentItem(
      number: '02',
      title: 'Enter',
      body: 'Provide only the information needed',
    ),
    LoginContentItem(
      number: '03',
      title: 'Verify',
      body: 'Confirm account ownership with a code',
    ),
    LoginContentItem(
      number: '04',
      title: 'Continue',
      body: 'Show success and the next useful action',
    ),
  ];

  static const testingPoints = <LoginContentItem>[
    LoginContentItem(
      number: '01',
      title: 'Task completion',
      body:
          'Can users create an account, log in and recover access without help?',
    ),
    LoginContentItem(
      number: '02',
      title: 'Choice clarity',
      body: 'Do people understand guest access versus account benefits?',
    ),
    LoginContentItem(
      number: '03',
      title: 'Error recovery',
      body:
          'Are invalid passwords, missing fields and expired codes easy to resolve?',
    ),
    LoginContentItem(
      number: '04',
      title: 'Cross-device legibility',
      body:
          'Do labels, tap targets and forms remain readable on older and newer devices?',
    ),
  ];

  static const challenges = <String>[
    'Balancing business data needs with a short form',
    'Making verification secure without adding anxiety',
    'Keeping the flow consistent across old and new devices',
  ];

  static const accelerators = <String>[
    'Building from familiar form patterns',
    'Using a clear black-and-white visual hierarchy',
    'Reusing consistent fields, buttons and feedback states',
  ];

  static const outcomes = <LoginContentItem>[
    LoginContentItem(
      number: '01',
      title: 'User-centered prioritization',
      body: 'The design responds to intent before asking for commitment.',
    ),
    LoginContentItem(
      number: '02',
      title: 'Conversion-aware UX',
      body: 'Fewer decisions and clearer value reduce avoidable drop-off.',
    ),
    LoginContentItem(
      number: '03',
      title: 'Scalable UI thinking',
      body:
          'Reusable fields, actions and states support consistent future growth.',
    ),
  ];
}

class LoginContentItem {
  const LoginContentItem({
    required this.number,
    required this.title,
    required this.body,
  });

  final String number;
  final String title;
  final String body;
}
