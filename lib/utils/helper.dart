class Helper {
  String formatNumber(int number) {
    String result = number.toString();
    if (result.length <= 3) {
      return result;
    }
    List<String> parts = [];
    while (result.length > 3) {
      parts.add(result.substring(result.length - 3));
      result = result.substring(0, result.length - 3);
    }
    parts.add(result);
    return parts.reversed.join('.');
  }

  String formatString(String text) {
    // Loại bỏ tất cả các khoảng trắng thừa trong chuỗi
    text = text.replaceAll(RegExp(r'\s+'), ' ');

    // Chia chuỗi thành các câu dựa trên dấu chấm
    List<String> sentences = text.split('. ');

    // Tạo một chuỗi mới bằng cách thêm dấu chấm vào đầu mỗi câu, ngoại trừ câu đầu tiên
    String formattedText = sentences.first;
    for (int i = 1; i < sentences.length; i++) {
      formattedText += '.\n${sentences[i]}';
    }

    return formattedText;
  }
}
