import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sample_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _controller = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: SampleData.email,
      query: 'subject=Portfolio Inquiry',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F7F7),
      child: PagePadding(
        vertical: 96,
        child: Column(
          children: [
            const SectionHeading(
              title: 'Start a Conversation',
              subtitle:
                  'For collaborations, commissions, or studio inquiries — reach out directly.',
            ),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your email address *',
                      hintStyle: AppTheme.sans.copyWith(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.foreground),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _submitted = true),
                        icon: const Icon(Icons.arrow_forward, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_submitted)
                    Text(
                      'Thank you. This demo form is ready to connect to your backend.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  const SizedBox(height: 28),
                  LuxuryTextButton(
                    label: SampleData.email,
                    onPressed: _openEmail,
                  ),
                  const SizedBox(height: 36),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    children: [
                      for (final entry in SampleData.socialLinks.entries)
                        LuxuryTextButton(
                          label: entry.key,
                          onPressed: () => _openLink(entry.value),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
