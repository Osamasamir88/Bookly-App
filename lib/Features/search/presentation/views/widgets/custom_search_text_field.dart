import 'package:bookly/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose(); // حماية الميموري
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          // هنا هيركب اللوجيك
          if (value.trim().isNotEmpty) {
            BlocProvider.of<SearchCubit>(context).featchBooksBySearch(value);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff1C1630),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white24),
          ),
          hintText: 'Search for any books ?',
          hintStyle: GoogleFonts.actor(),
          prefixIcon: Icon(Icons.search, size: 28),
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: Icon(Icons.close, size: 25),
          ),
        ),
      ),
    );
  }
}
