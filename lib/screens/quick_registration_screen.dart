import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/routing_service.dart';

/// Universal Quick Registration Fullscreen Component.
class QuickRegistrationScreen extends StatelessWidget {
  final String? headline;
  final String? headlineAccent;
  final String? description;
  final String? ctaText;
  final String? footerText;
  final String registrationUrl;
  final String backgroundAsset;
  final Color primaryCtaColor;
  final Color accentTextColor;
  final VoidCallback? onClose;
  final VoidCallback? onCtaPressed;

  const QuickRegistrationScreen({
    super.key,
    this.headline,
    this.headlineAccent,
    this.description,
    this.ctaText,
    this.footerText,
    this.registrationUrl = 'https://applinkgo.com/srf2PnRD',
    this.backgroundAsset = 'assets/stadium_bg.jpg',
    this.primaryCtaColor = const Color(0xFF007AFF),
    this.accentTextColor = const Color(0xFF2979FF),
    this.onClose,
    this.onCtaPressed,
  });

  static final Map<String, Map<String, String>> _translations = {
    'ru': {
      'headline': 'Быстрая',
      'headlineAccent': 'регистрация',
      'description':
          'Зарегистрируйтесь на сайте и откройте доступ к актуальному предложению. Регистрация займёт всего пару минут.',
      'cta': 'Перейти к регистрации',
      'footer': 'После нажатия откроется сайт для регистрации.',
    },
    'en': {
      'headline': 'Quick',
      'headlineAccent': 'Registration',
      'description':
          'Register on the website and get access to the latest exclusive offer. Registration takes only a few minutes.',
      'cta': 'Proceed to Registration',
      'footer': 'The registration website will open after tapping.',
    },
    'es': {
      'headline': 'Registro',
      'headlineAccent': 'Rápido',
      'description':
          'Regístrese en el sitio web y obtenga acceso a la oferta actual. El registro solo toma un par de minutos.',
      'cta': 'Ir al registro',
      'footer': 'El sitio de registro se abrirá tras pulsar.',
    },
    'pt': {
      'headline': 'Cadastro',
      'headlineAccent': 'Rápido',
      'description':
          'Cadastre-se no site e tenha acesso à oferta atual. O cadastro leva apenas alguns minutos.',
      'cta': 'Ir para o cadastro',
      'footer': 'O site de cadastro será aberto após clicar.',
    },
    'kk': {
      'headline': 'Жылдам',
      'headlineAccent': 'тіркелу',
      'description':
          'Сайтта тіркеліп, өзекті ұсынысқа қол жеткізіңіз. Тіркелу бар болғаны бірнеше минут алады.',
      'cta': 'Тіркелуге өту',
      'footer': 'Басқаннан кейін тіркелу сайты ашылады.',
    },
    'tr': {
      'headline': 'Hızlı',
      'headlineAccent': 'Kayıt',
      'description':
          'Web sitesine kaydolun ve güncel teklife erişim kazanın. Kayıt sadece birkaç dakika sürer.',
      'cta': 'Kayıt Olmaya Git',
      'footer': 'Tıkladıktan sonra kayıt sitesi açılacaktır.',
    },
    'de': {
      'headline': 'Schnelle',
      'headlineAccent': 'Registrierung',
      'description':
          'Registrieren Sie sich auf der Website und erhalten Sie Zugang zum aktuellen Angebot. Die Registrierung dauert nur wenige Minuten.',
      'cta': 'Zur Registrierung',
      'footer': 'Nach dem Antippen öffnet sich die Registrierungsseite.',
    },
  };

  Map<String, String> _getLocalizedStrings(BuildContext context) {
    final locale = PlatformDispatcher.instance.locale.languageCode.toLowerCase();
    return _translations[locale] ?? _translations['en']!;
  }

  @override
  Widget build(BuildContext context) {
    final loc = _getLocalizedStrings(context);

    final displayHeadline = headline ?? loc['headline']!;
    final displayHeadlineAccent = headlineAccent ?? loc['headlineAccent']!;
    final displayDescription = description ?? loc['description']!;
    final displayCta = ctaText ?? loc['cta']!;
    final displayFooter = footerText ?? loc['footer']!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Stadium background image
          Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFF0A121A),
            ),
          ),

          // 2. Cinematic darkened gradient overlay
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.50),
                  Colors.black.withValues(alpha: 0.20),
                  Colors.black.withValues(alpha: 0.40),
                  Colors.black.withValues(alpha: 0.85),
                ],
                stops: const [0.0, 0.25, 0.65, 1.0],
              ),
            ),
          ),

          // 3. Foreground content & UI controls
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top navigation row with Close 'X' button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Material(
                              color: Colors.black.withValues(alpha: 0.35),
                              shape: const CircleBorder(),
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: onClose,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.close_rounded,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 2),

                  // Headline block
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        displayHeadline,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 34,
                          height: 1.15,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        displayHeadlineAccent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          height: 1.15,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: accentTextColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          displayDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.45,
                            color: Colors.white.withValues(alpha: 0.88),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 3),

                  // Main CTA Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: onCtaPressed ?? () => RoutingService.openRegistrationUrl(registrationUrl),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryCtaColor,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        shadowColor: primaryCtaColor.withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              displayCta,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Footer caption
                  Text(
                    displayFooter,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.72),
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
