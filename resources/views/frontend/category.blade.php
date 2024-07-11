@extends('layouts.app')

@section('content')
<!-- Content -->
<div class="content-wrap clearfix">
  <div class="mccan page">
    <h3 class="title-small">Blog</h3>
    <h2 class="title">{{ $this_category->name }}</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <div class="row">
            <div class="col-md-8">
              <div class="blog-listing">
                @if($category_posts->isEmpty())

                <h2 class="title-medium">Nothing Here (⊙_⊙;)</h2>

                @else
                @foreach ($category_posts as $post)
                <article class="post">
                  <div class="media">
                    <a href="{{ route('blog.detail', ['slug' => $post->slug, 'category' => $post->category->name]) }}"> <img src="{{ Voyager::image($post->image) }}" alt="{{ $post->title }}"> </a>
                  </div>
                  <header class="header">
                    <h4><a href="{{ route('blog.detail', ['slug' => $post->slug, 'category' => $post->category->name]) }}">{{ $post->title }}</a></h4>
                    <div class="meta-data"> <span class="meta-date">{{ Carbon\Carbon::parse($post->created_at)->format('d M Y') }}</span></div>
                    <div class="excerpt">
                      <p style="display: -webkit-box;
                      -webkit-line-clamp: 3; /* Number of lines to show */
                      -webkit-box-orient: vertical;
                      overflow: hidden;
                      text-overflow: ellipsis;">{{$post->excerpt}}</p>
                      <a href="{{ route('blog.detail', ['slug' => $post->slug, 'category' => $post->category->name]) }}" class="btn">Read more </a>
                    </div>
                  </header>
                </article>
                @endforeach

                {{ $category_posts->links('vendor.pagination') }}
                @endif
              </div>
            </div>
            <div class="col-md-4">
              <div class="mccan-sidebar-part">
                <div class="mccan-sidebar-block mccan-sidebar-block-search animate-box fadeInLeft animated" data-animate-effect="fadeInLeft">
                  <form class="mccan-sidebar-search-form" method="get" action="{{ route('blog.search') }}">
                    @csrf

                    <input type="text" name="key" id="search" placeholder="Search...">
                    <button type="submit" class="ti-arrow-right mccan-sidebar-search-submit"></button>
                  </form>
                </div>
                <div class="mccan-sidebar-block mccan-sidebar-block-categories animate-box fadeInLeft animated" data-animate-effect="fadeInLeft">
                  <div class="mccan-sidebar-block-title"> Categories </div>
                  <div class="mccan-sidebar-block-content">
                    <ul class="ul1">
                      @foreach ($category as $c)
                      <li><a href="{{ route('blog.category',$c->slug) }}">{{ $c->name }}</a></li>
                      @endforeach
                    </ul>
                  </div>
                </div>
                <div class="mccan-sidebar-block mccan-sidebar-block-latest-posts animate-box fadeInLeft animated" data-animate-effect="fadeInLeft">
                  <div class="mccan-sidebar-block-title"> Featured Posts </div>
                  <div class="mccan-sidebar-block-content">
                    <div class="latest">
                      @foreach ($featured_posts as $f)
                      <a href="{{ route('blog.detail',['slug' => $f->slug, 'category' => $f->category->name]) }}" class="clearfix">
                        <div class="txt1">{{ $f->title }}</div>
                        <div class="txt2 mt-0">{{ Carbon\Carbon::parse($f->created_at)->format('d M Y') }}</div>
                      </a>
                      @endforeach
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Copyright -->
  <div class="copyright">
    <p>&copy; {{ Carbon\Carbon::now()->year }} <a href="{{ route('index') }}">{{ Voyager::setting('site.title') }}</a>. All Rights Reserved.</p>
  </div>
</div>
@endsection
