import 'dart:math';

/// Simulated benchmark data based on published PM&R board statistics.
/// ABPMR reports ~75% first-time pass rate. These distributions are
/// approximations for educational purposes only.
class BenchmarkData {
  static const double meanScore = 68.0;
  static const double stdDev = 12.0;

  static const Map<String, double> domainMeans = {
    'B': 65.0,
    'C': 70.0,
    'D': 72.0,
    'E': 74.0,
  };

  static const Map<String, double> domainStdDevs = {
    'B': 14.0,
    'C': 12.0,
    'D': 11.0,
    'E': 10.0,
  };

  static const Map<String, String> domainNames = {
    'B': 'Problem Solving',
    'C': 'Patient Management',
    'D': 'Systems-Based Practice',
    'E': 'Interpersonal Skills',
  };

  /// Estimate percentile using normal CDF approximation.
  static double percentile(double score) {
    final z = (score - meanScore) / stdDev;
    return (_normalCdf(z) * 100).clamp(1.0, 99.0);
  }

  /// Estimate domain-specific percentile.
  static double domainPercentile(String domain, double score) {
    final mean = domainMeans[domain] ?? meanScore;
    final sd = domainStdDevs[domain] ?? stdDev;
    final z = (score - mean) / sd;
    return (_normalCdf(z) * 100).clamp(1.0, 99.0);
  }

  /// Rational approximation to the normal CDF.
  static double _normalCdf(double z) {
    // Abramowitz & Stegun approximation
    const a1 = 0.254829592;
    const a2 = -0.284496736;
    const a3 = 1.421413741;
    const a4 = -1.453152027;
    const a5 = 1.061405429;
    const p = 0.3275911;

    final sign = z < 0 ? -1.0 : 1.0;
    final x = z.abs() / sqrt(2);
    final t = 1.0 / (1.0 + p * x);
    final y = 1.0 -
        (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * exp(-x * x);

    return 0.5 * (1.0 + sign * y);
  }
}
