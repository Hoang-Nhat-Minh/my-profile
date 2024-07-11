@extends('layouts.app')

@section('css')
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v20.0&appId=1098960451224710" nonce="3zwePEK2"></script>
@endsection

@section('content')
<!-- Content -->
<div class="content-wrap">
  <div class="mccan page">
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <article class="post">
            <header class="header">
              <h4>{{ $post->title }}</h4>
              <div class="meta-data">
                <span class="meta-date">{{ Carbon\Carbon::parse($post->created_at)->format('d M Y') }}</span>
                <span class="meta-categories"><a href="blog.html">{{ $post->category->name }}</a></span>
              </div>
            </header>
            <div class="media">
              <img src="{{ Voyager::image($post->image) }}" alt="{{ $post->title }}">
            </div>
            <div class="content">
              {!! $post->body!!}
            </div>
            <div class="comment-contact">
              <span class="reply-title">Share: </span>
              @php
              $shareUrl = urlencode(Request::url());
              $url = Request::url();
              @endphp
              <a style="text-decoration: none;color:inherit" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={{ $shareUrl }}&amp;src=sdkpreparse"><i class="ti-facebook m-1"></i></a>
              <a style="text-decoration: none;color:inherit" target="_blank" href="https://twitter.com/intent/tweet?url={{ $url }}"><i class="ti-twitter-alt m-1"></i></a>
              <style>
                #shareIcon {
                  cursor: pointer;
                  transition: opacity 0.3s, transform 0.3s;
                }

                .fade-out {
                  opacity: 0;
                  transform: scale(0.5);
                }

                .fade-in {
                  opacity: 1;
                  transform: scale(1);
                }

              </style>
              <i id="shareIcon" class="ti-sharethis m-1 icon"></i>
              <script>
                function copyLink(url) {
                  const tempInput = document.createElement('input');
                  tempInput.value = url;
                  document.body.appendChild(tempInput);
                  tempInput.select();
                  document.execCommand('copy');
                  document.body.removeChild(tempInput);

                  const shareIcon = document.getElementById('shareIcon');
                  shareIcon.classList.add('fade-out');

                  shareIcon.addEventListener('transitionend', () => {
                    shareIcon.classList.remove('ti-sharethis', 'fade-out');
                    shareIcon.classList.add('ti-check', 'fade-in');
                  }, {
                    once: true
                  });
                }

                document.getElementById('shareIcon').addEventListener('click', () => copyLink('{{ $url }}'));

              </script>
            </div>
          </article>
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
