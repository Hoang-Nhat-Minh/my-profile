<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;
use TCG\Voyager\Models\Post;
use App\Job;
use App\Info;
use App\Service;
use App\Resume;
use App\Skill;
use App\Project;
use App\Contact;

class PageController extends Controller
{
    public function index()
    {
        $jobs = Job::get();
        $jobNames = $jobs->pluck('name');

        $infos = Info::find(1)->first();

        $servies = Service::get();

        return view('frontend.index', compact('jobNames', 'infos', 'servies'));
    }

    public function resume()
    {
        $resume_education = Resume::where('type', 1)->get();

        $resume_experience = Resume::where('type', 2)->get();

        $skill_coding = Skill::where('type', 2)->get();

        $skill_language = Skill::where('type', 1)->get();

        $skill_language_name = $skill_language->pluck('name')->toArray();

        $skill_language_point = $skill_language->pluck('point')->toArray();

        return view('frontend.resume', compact('resume_education', 'resume_experience', 'skill_coding', 'skill_language', 'skill_language_point', 'skill_language_name'));
    }

    public function portfolio()
    {
        $projects = Project::get();

        return view('frontend.portfolio', compact('projects'));
    }

    public function project($slug)
    {
        $project = Project::where('slug', $slug)->first();

        return view('frontend.project', compact('project'));
    }
    public function contact()
    {
        return view('frontend.contact');
    }

    public function contact_store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:255',
            'email' => 'max:255',
            'number' => 'required|numeric|digits_between:10,13',
            'subject' => 'required|max:255',
            'message' => 'required|max:255',
        ], [
            'name.required' => 'Name is required.',
            'name.max' => 'Too Long.',
            'subject.required' => 'Subject is required.',
            'subject.max' => 'Too Long.',
            'email.max' => 'Too Long.',
            'number.required' => 'Your phone number is required.',
            'number.numeric' => 'Your phone number must be numeric.',
            'number.digits_between' => 'Your phone number must be between 10 and 13 digits.',
            'message.required' => 'Message is required.',
            'message.max' => 'Too Long.',
        ]);

        Contact::create($data);

        $alert = [
            "type" => "success",
            "title" => __("Success"),
            "body" => __("Thank you, I will respond as soon as possible!")
        ];

        return redirect()->back()->with('alert', $alert);
    }

    public function blog()
    {
        $posts = Post::orderBy('created_at', 'desc')->paginate(3);

        $featured_posts = Post::where('featured', 1)->orderBy('created_at', 'desc')->limit(5)->get();

        $category = Category::get();

        return view('frontend.blog', compact('posts', 'featured_posts', 'category'));
    }

    public function blog_detail($categoery, $slug)
    {
        $post = Post::where('slug', $slug)->first();

        return view('frontend.blog-detail', compact('post'));
    }

    public function blog_category($slug)
    {
        $this_category = Category::where('slug', $slug)->first();

        $category_posts = Post::where('category_id', $this_category->id)->paginate(3);

        $featured_posts = Post::where('featured', 1)->orderBy('created_at', 'desc')->limit(5)->get();

        $category = Category::get();

        return view('frontend.category', compact('category_posts', 'featured_posts', 'category', 'this_category'));
    }

    public function blog_search(Request $request)
    {
        $search_posts = Post::where('title', 'like', '%' . $request->key . '%')->paginate(3);
        // dd($post);
        $featured_posts = Post::where('featured', 1)->orderBy('created_at', 'desc')->limit(5)->get();

        $category = Category::get();

        return view('frontend.search', compact('search_posts', 'featured_posts', 'category'));
    }
}
