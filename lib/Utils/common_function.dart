import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Utils/string_constants.dart';
import 'package:path/path.dart' as p;
import 'dart:developer' as dev;

void printWarning(String text) {
  dev.log('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  dev.log('\x1B[31m$text\x1B[0m');
}

//Hex code convert into color
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

Widget imageLoad(String? imgPath) {
  String? extImg;
  //check the imgPath
  if (imgPath?.isNotEmpty==true) {
    extImg = p.extension(imgPath!);
    if (imgPath.isURL) {
      if (extImg.toLowerCase() == '.svg') {
        return SvgPicture.network(
          imgPath,
          placeholderBuilder: (context) {
            return Image.asset(placeHolder);
          },
        );
      } else {
        return imageLoader(imgPath);
      }
    } else {
      if (extImg.toLowerCase() == '.svg') {
        return SvgPicture.asset(imgPath);
      } else {
        return Image.asset(imgPath);
      }
    }
  } else {
    return Image.asset(placeHolder);
  }
}

Image imageLoader(String imgPath) {
  return Image.network(imgPath,
          loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const CircularProgressIndicator();
        }
      },
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(placeHolder);
    },
  );
}


