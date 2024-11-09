
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/theme/app_colors.dart';

final textTitle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor);

final textSubtitle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor);

final textItem = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryColor);


final textButton = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white);

final textHint = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.blueGrey);

final textFormFieldDecoration = InputDecoration(
    fillColor: AppColors.backgroundColor,
    filled: true,
    alignLabelWithHint: true,
    hintStyle: textHint,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryColor, width: 0),
        borderRadius: BorderRadius.all(Radius.circular(8))
    ),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(8))
    )
);

final mainButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(65),
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)));
