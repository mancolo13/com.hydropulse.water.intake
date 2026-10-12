import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  int _selectedFilter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HydroPulse • Beverages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primary),
            tooltip: 'Special Offers',
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _buildFilterChip(0, 'Day'),
                const SizedBox(width: 8),
                _buildFilterChip(1, 'Week'),
                const SizedBox(width: 8),
                _buildFilterChip(2, 'Month'),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weekly Intake Trends', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.textPrimary)),
                      Text('+18.5%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.secondary)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Active hydration volume vs recommended index', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar('Mon', 0.45, false),
                        _buildBar('Tue', 0.65, false),
                        _buildBar('Wed', 0.85, false),
                        _buildBar('Thu', 0.5, false),
                        _buildBar('Fri', 0.95, true),
                        _buildBar('Sat', 0.7, false),
                        _buildBar('Sun', 0.6, false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                _buildMetricTile('Pure Water', '1,650 ml', '68%', Icons.water_drop_rounded, AppTheme.primary),
                _buildMetricTile('Herbal Tea', '450 ml', '18%', Icons.emoji_food_beverage_rounded, AppTheme.secondary),
                _buildMetricTile('Electrolytes', '250 ml', '10%', Icons.bolt_rounded, AppTheme.primary),
                _buildMetricTile('Infused Citrus', '100 ml', '4%', Icons.local_florist_rounded, AppTheme.secondary),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Сводка напитков обновлена!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Refresh Breakdown', style: TextStyle(fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primary,
                  side: BorderSide(color: AppTheme.primary.withValues(alpha: 0.6)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(int index, String label) {
    final isSelected = _selectedFilter == index;
    return InkWell(
      onTap: () => setState(() => _selectedFilter = index),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.primary : Colors.white12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildBar(String day, double heightFraction, bool isHighlight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 14,
          height: 70 * heightFraction,
          decoration: BoxDecoration(
            color: isHighlight ? AppTheme.primary : AppTheme.primary.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: TextStyle(
            fontSize: 10,
            color: isHighlight ? AppTheme.primary : AppTheme.textSecondary,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricTile(String title, String val, String badge, IconData icon, Color accent) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: accent, size: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(badge, style: TextStyle(color: accent, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(val, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: AppTheme.textPrimary)),
              Text(title, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}
