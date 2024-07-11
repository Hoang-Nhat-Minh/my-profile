@if ($paginator->hasPages())
<div class="mccan-blog-navigation">
  <ul>
    {{-- Previous Page Link --}}
    @if ($paginator->onFirstPage())
    {{-- Hide left arrow on the first page --}}
    @else
    <li class="mccan-black-bg"><a href="{{ $paginator->previousPageUrl() }}"><i class="ti-angle-left"></i></a></li>
    @endif

    {{-- Pagination Elements --}}
    @foreach ($elements as $element)
    {{-- "Three Dots" Separator --}}
    @if (is_string($element))
    <li class="disabled" aria-disabled="true"><span>{{ $element }}</span></li>
    @endif

    {{-- Array Of Links --}}
    @if (is_array($element))
    @foreach ($element as $page => $url)
    @if ($page == $paginator->currentPage())
    <li><a class="active" href="{{ $url }}">{{ $page }}</a></li>
    @else
    <li><a href="{{ $url }}">{{ $page }}</a></li>
    @endif
    @endforeach
    @endif
    @endforeach

    {{-- Next Page Link --}}
    @if ($paginator->hasMorePages())
    <li class="mccan-black-bg"><a href="{{ $paginator->nextPageUrl() }}"><i class="ti-angle-right"></i></a></li>
    @else
    {{-- Hide right arrow on the last page --}}
    @endif
  </ul>
</div>
@endif
