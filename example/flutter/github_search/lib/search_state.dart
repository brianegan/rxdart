import 'package:github_search/github_api.dart';

// The State represents the data the View requires. The View consumes a Stream
// of States. The view rebuilds every time the Stream emits a new State!
//
// The State Stream will emit new States depending on the situation: The
// initial state, loading states, the list of results, and any errors that
// happen.
//
// The State Stream responds to input from the View by accepting a
// Stream<String>. We call this Stream the onTextChanged "intent".
class SearchState {
  final bool loadingVisible;
  final bool errorVisible;
  final bool noTermVisible;
  final bool resultsVisible;
  final bool emptyVisible;
  final List<SearchResultItem> items;

  SearchState({
    this.loadingVisible = false,
    this.errorVisible = false,
    this.noTermVisible = false,
    this.resultsVisible = false,
    this.emptyVisible = false,
    this.items = const [],
  });
}

class SearchLoading extends SearchState {
  SearchLoading() : super(loadingVisible: true);
}

class SearchError extends SearchState {
  SearchError() : super(errorVisible: true);
}

class SearchNoTerm extends SearchState {
  SearchNoTerm() : super(noTermVisible: true);
}

class SearchPopulated extends SearchState {
  SearchPopulated(List<SearchResultItem> items)
      : super(
          resultsVisible: true,
          items: items,
        );
}

class SearchEmpty extends SearchState {
  SearchEmpty() : super(emptyVisible: true);
}
