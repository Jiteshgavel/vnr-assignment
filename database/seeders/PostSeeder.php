<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Support\Str;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $authors = User::where('role', 'author')->get();
        $categories = Category::all();
        $tags = Tag::all();

        for ($i = 1; $i <= 10; $i++) {
            $title = "Sample Post Title $i";
            $post = Post::create([
                'title' => $title,
                'slug' => Str::slug($title),
                'content' => 'This is the content of post ' . $i,
                'category_id' => $categories->random()->id,
                'user_id' => $authors->random()->id,
                'status' => 'approved',
                'published_at' => now()
            ]);

            // Attach 2 to 5 random tags
            $post->tags()->attach($tags->random(rand(2, 5))->pluck('id')->toArray());
        }
    }
}
