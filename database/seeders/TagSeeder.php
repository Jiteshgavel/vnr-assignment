<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Tag;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tags = ['Laravel', 'PHP', 'JavaScript', 'VueJS', 'React', 'MySQL', 'API', 'Backend', 'Frontend', 'Web', 'Security', 'Testing', 'DevOps', 'Cloud', 'Docker'];

        foreach ($tags as $tag) {
            Tag::create([
                'name' => $tag,
                'slug' => \Str::slug($tag)
            ]);
        }
    }
}
