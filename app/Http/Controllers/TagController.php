<?php
namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class TagController extends Controller
{
    public function index()
    {
        return Tag::all();
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:tags',
            'slug' => 'nullable|string|unique:tags',
        ]);

        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);

        $tag = Tag::create($data);

        return response()->json($tag, 201);
    }

    public function show(Tag $tag)
    {
        return $tag;
    }

    public function update(Request $request, Tag $tag)
    {
        $data = $request->validate([
            'name' => 'sometimes|required|string|unique:tags,name,' . $tag->id,
            'slug' => 'nullable|string|unique:tags,slug,' . $tag->id,
        ]);

        if (isset($data['name']) && empty($data['slug'])) {
            $data['slug'] = Str::slug($data['name']);
        }

        $tag->update($data);

        return response()->json($tag);
    }

    public function destroy(Tag $tag)
    {
        $tag->delete();
        return response()->json(['message' => 'Tag deleted successfully']);
    }
}
