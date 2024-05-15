class PriceUtil {
  static String formatPrice(int? price) {
    // Convert price to a string with commas for thousands separator
    String formattedPrice = price.toString();

    // Remove trailing '.00' if present
    if (formattedPrice.contains('.')) {
      formattedPrice = formattedPrice.replaceAll(RegExp(r'0*$'), '');
      formattedPrice = formattedPrice.replaceAll(RegExp(r'\.$'), '');
    }

    // Add commas as thousands separator
    final parts = formattedPrice.split('.');
    final formatter = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAllMapped(formatter, (match) => '${match[1]},');

    // Return the formatted price
    return parts.join('.') +' đ';
  }
}
