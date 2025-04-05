<?php
namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cache;

class PostController extends Controller
{
    public function index()
    {
        $posts = Cache::remember('posts_all', now()->addMinutes(10), function () {
            return Post::all(); 
        });
        return response()->json($posts);
    }

    public function postSearch(Request $request)
    {
        $query = Post::with(['category', 'tags', 'user']);
        if ($request->filled('q')) {
            $keyword = $request->input('q');
            $query->where(function ($q) use ($keyword) {
                $q->where('title', 'like', "%{$keyword}%")
                    ->orWhere('content', 'like', "%{$keyword}%");
            });
        }
        if ($request->filled('category')) {
            $query->whereHas('category', function ($q) use ($request) {
                $q->where('slug', $request->input('category'));
            });
        }
        if ($request->filled('tag')) {
            $query->whereHas('tags', function ($q) use ($request) {
                $q->where('slug', $request->input('tag'));
            });
        }

        $posts = $query->latest()->paginate(10);

        return response()->json($posts);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string|unique:posts',
            'content' => 'required',
            'category_id' => 'required|exists:categories,id',
            'status' => 'in:pending,approved,rejected',
            'published_at' => 'nullable|date',
            'tag_ids' => 'array|nullable',
            'tag_ids.*' => 'exists:tags,id'
        ]);

        $data['user_id'] = auth()->id();
        
        $data['slug'] = $data['slug'] ?? Str::slug($data['title']);

        $post = Post::create($data);

        if (!empty($data['tag_ids'])) {
            $post->tags()->sync($data['tag_ids']);
        }

        Cache::forget('posts_all');
        return response()->json($post->load(['category', 'tags']), 201);
    }

    public function show(Post $post)
    {
        return $post->load(['category', 'user', 'tags']);
    }

    public function update(Request $request, Post $post)
    {
        $data = $request->validate([
            'title' => 'sometimes|required|string|max:255',
            'slug' => 'nullable|string|unique:posts,slug,' . $post->id,
            'content' => 'sometimes|required',
            'category_id' => 'sometimes|required|exists:categories,id',
            'status' => 'in:pending,approved,rejected',
            'published_at' => 'nullable|date',
            'tag_ids' => 'array|nullable',
            'tag_ids.*' => 'exists:tags,id'
        ]);

        if (isset($data['title']) && empty($data['slug'])) {
            $data['slug'] = Str::slug($data['title']);
        }

        $post->update($data);

        if (isset($data['tag_ids'])) {
            $post->tags()->sync($data['tag_ids']);
        }

        Cache::forget('posts_all');
        return response()->json($post->load(['category', 'tags']));
    }

    public function destroy(Post $post)
    {
        $post->delete();
        Cache::forget('posts_all');
        return response()->json(['message' => 'Post deleted successfully']);
    }
}
