import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/Features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is SearchSuccess
            ? ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 5),
                itemCount: state.books.length,
                itemBuilder: (context, index) =>
                    BookListViewItem(book: state.books[index]),
              )
            : state is SearchFailure
            ? Column(
              children: [
                CustomErrorWidget(errMessage: state.errMessage),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: () {
                  var cubit = BlocProvider.of<SearchCubit>(context);
                  if (cubit.lastSearchQuery != null) {
                    cubit.featchBooksBySearch(cubit.lastSearchQuery!);
                  }
                }, child: Text('Retry')),
              ],
            )
            
            : state is SearchLoading
            ? Center(child: CircularProgressIndicator())
            : SizedBox();
      },
    );
  }
}
