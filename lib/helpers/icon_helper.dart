class IconHelper {
  
  static String generateIcon({String? program, String? prefix}) {
    if (program == null) return 'assets/icons/menu/ic_skd${prefix??''}.png';
    if (program.toLowerCase().contains('skd'))
      return 'assets/icons/menu/ic_skd${prefix??''}.png';
    if (program.toLowerCase().contains('skb'))
      return 'assets/icons/menu/ic_skb${prefix??''}.png';
    if (program.toLowerCase().contains('tps'))
      return 'assets/icons/menu/ic_tps${prefix??''}.png';
    if (program.toLowerCase().contains('tpa'))
      return 'assets/icons/menu/ic_tpa${prefix??''}.png';
    if (program.toLowerCase().contains('tka'))
      return 'assets/icons/menu/ic_tka${prefix??''}.png';
    if (program.toLowerCase().contains('samapta'))
      return 'assets/icons/menu/ic_samapta${prefix??''}.png';
    return 'assets/icons/menu/ic_skd${prefix??''}.png';
  }
}