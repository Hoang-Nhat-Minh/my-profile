@extends('layouts.app')
@section('content')
<!-- Content -->
<div class="content-wrap clearfix">
  <div class="mccan page">
    <h3 class="title-small">Take A Look At My</h3>
    <h2 class="title">Projects</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <div class="row">
            @foreach ($projects as $key => $project)
            <div class="col-md-6">
              <a href="{{ route('project',$project->slug) }}" class="desc">
                <div class="project"> <img src="{{ Voyager::image($project->img) }}" class="img-fluid" alt="">
                  <div class="desc">
                    <div class="con">
                      <h3>Project {{ $key + 1 }}</h3> <span>{{ $project->title }}</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>
    <h3 class="title-medium">See More At GitHub: <a href="{{ Voyager::setting('site.github') }}" target="_blank" style="text-decoration: underline">Github</a></h3>
  </div>
  <!-- Copyright -->
  <div class="copyright">
    <p>&copy; {{ Carbon\Carbon::now()->year }} <a href="{{ route('index') }}">{{ Voyager::setting('site.title') }}</a>. All Rights Reserved.</p>
  </div>
</div>
@endsection
