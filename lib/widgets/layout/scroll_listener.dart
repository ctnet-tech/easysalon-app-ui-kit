class ScrollListener {
  ScrollListener(
      {this.scrollToBottomOffset,
      this.scrollToTopOffset,
      this.onScrollToTop,
      this.onScrollToBottom});

  final double? scrollToBottomOffset;
  final double? scrollToTopOffset;

  final Function? onScrollToBottom;
  final Function? onScrollToTop;
}
