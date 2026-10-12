import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  bool _notificationAlerts = true;
  bool _smartSync = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HydroPulse • Reminders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.tune_rounded, color: AppTheme.primary, size: 20),
                          SizedBox(width: 8),
                          Text('Adaptive Interval Engine', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.textPrimary)),
                        ],
                      ),
                      Switch(
                        value: _smartSync,
                        activeThumbColor: AppTheme.primary,
                        onChanged: (v) => setState(() => _smartSync = v),
                      ),
                    ],
                  ),
                  const Divider(height: 8, color: Colors.white10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.notifications_active_outlined, color: AppTheme.secondary, size: 20),
                          SizedBox(width: 8),
                          Text('Push Chime Notifications', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.textPrimary)),
                        ],
                      ),
                      Switch(
                        value: _notificationAlerts,
                        activeThumbColor: AppTheme.secondary,
                        onChanged: (v) => setState(() => _notificationAlerts = v),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Daily Hydration Stream', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.textPrimary)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('4 COMPLETED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildTimelineItem('Morning Awakening Glass (350ml)', '07:30 AM', 'DONE', Icons.wb_sunny_rounded, AppTheme.secondary),
            const SizedBox(height: 10),
            _buildTimelineItem('Midday Focus Hydration (400ml)', '11:15 AM', 'DONE', Icons.wb_twilight_rounded, AppTheme.primary),
            const SizedBox(height: 10),
            _buildTimelineItem('Pre-Workout Electrolytes (500ml)', '03:45 PM', 'DONE', Icons.fitness_center_rounded, AppTheme.secondary),
            const SizedBox(height: 10),
            _buildTimelineItem('Evening Calming Herbal Tea (300ml)', '07:00 PM', 'LOGGED', Icons.nightlight_round, AppTheme.primary),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Новое напоминание запланировано!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(Icons.add_circle_outline, size: 20),
                label: const Text('Schedule Reminder', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.surface,
                  foregroundColor: AppTheme.primary,
                  side: BorderSide(color: AppTheme.primary.withValues(alpha: 0.4)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String time, String badge, IconData icon, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: accent, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.textPrimary),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(time, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              badge,
              style: TextStyle(color: accent, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
