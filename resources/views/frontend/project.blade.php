@extends('layouts.app')
@section('content')
<!-- Content -->
<div class="content-wrap">
  <div class="mccan page">
    <h3 class="title-small">Project</h3>
    <h2 class="title">{{ $project->title }}</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <div class="project-listing">
            <div class="project">
              <header class="header">
                <div class="excerpt">
                  {!! $project->des !!}
                  <div class="list">
                    <ul>
                      <li><strong>Project Name :</strong> {{ $project->title }}</li>
                      <li><strong>Client :</strong> {{ $project->client }}</li>
                      <li><strong>Skills :</strong> {{ $project->skill }}</li>
                      <li><strong>Contact Me :</strong> <a href="{{ route('contact') }}">Contact</a></li>
                    </ul>
                  </div>
                </div>
              </header>
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
