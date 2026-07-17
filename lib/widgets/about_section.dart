import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return PagePadding(
      vertical: 96,
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SectionHeading(
                    title: 'About',
                    subtitle: SampleData.aboutText,
                    centered: false,
                  ),
                ),
                const SizedBox(width: 72),
                Expanded(
                  child: _AboutDetails(),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(
                  title: 'About',
                  subtitle: SampleData.aboutText,
                  centered: false,
                ),
                const SizedBox(height: 40),
                _AboutDetails(),
              ],
            ),
    );
  }
}

class _AboutDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailRow(label: 'Name', value: SampleData.ownerName),
        _DetailRow(label: 'Role', value: SampleData.tagline),
        _DetailRow(label: 'Focus', value: 'Design Systems & Brand Strategy'),
        _DetailRow(label: 'Expertise', value: 'UX/UI Specialist'),
        _DetailRow(label: 'Platforms', value: 'Web, iOS & Android'),
        const SizedBox(height: 28),
        Text(
          'CAPABILITIES',
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            letterSpacing: 2.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _CapabilityChip('Design Systems'),
            _CapabilityChip('Brand Strategy'),
            _CapabilityChip('UX/UI Design'),
            _CapabilityChip('Web'),
            _CapabilityChip('iOS'),
            _CapabilityChip('Android'),
          ],
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CapabilityChip extends StatelessWidget {
  const _CapabilityChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
