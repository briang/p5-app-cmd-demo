package Text::KWIC;

use 5.022;

use strict;  use warnings;  use autodie qw/:all/;
use experimental qw(signatures);

use Data::Dump;
################################################################################
my $kwic = Text::KWIC->new;

sub new($class) {
    my $self = bless {}, $class;

    while (my $title = <DATA>) {
        next if rand > 0.1;
        chomp $title;
        my $words = $title =~ s/[,!'-?]/ /gr;
        die $_ unless $words =~ m/^[\w ]*$/;

        my %words = map { lc $_ => 1 } split ' ', $words;

        for my $word (keys %words) {
            push @{ $self->{kwic}{$word} }, $title
              unless length($word) <= 1 or exists $self->stop_words->{$word};
        }
    }
dd $self;
    return $self;
}

sub stop_words($self) {
    return {
        map { $_ => 1 } qw{ an and in is of the to }
    };
}

1;

__DATA__
A Catskill Eagle
A Confederacy of Dunces
A Darkling Plain
A Fanatic Heart
A Farewell to Arms
A Glass of Blessings
A Handful of Dust
A Many-Splendoured Thing
A Monstrous Regiment of Women
A Passage to India
A Scanner Darkly
A Summer Bird-Cage
A Swiftly Tilting Planet
A Time of Gifts
A Time to Kill
After Many a Summer Dies the Swan
Ah, Wilderness!
Alien Corn
All Passion Spent
All the King's Men
Alone on a Wide, Wide Sea
An Acceptable Time
An Evil Cradling
An Instant in the Wind
Antic Hay
Arms and the Man
As I Lay Dying
Behold the Man
Beneath the Bleeding
Beyond the Mexique Bay
Blithe Spirit
Blood's a Rover
Blue Remembered Earth
Blue Remembered Hills
Bonjour Tristesse
Brandy of the Damned
Bury My Heart at Wounded Knee
Butter In a Lordly Dish
By Grand Central Station I Sat Down and Wept
Cabbages and Kings
Carrion Comfort
Clouds of Witness
Consider Phlebas
Consider the Lilies
Cover Her Face
Dance Dance Dance
Death Be Not Proud
Down to a Sunless Sea
Dulce et Decorum Est
Dying of the Light
East of Eden
Ego Dominus Tuus
Endless Night
Everything is Illuminated
Eyeless in Gaza
Fair Stood the Wind for France
Fame Is the Spur
Far From the Madding Crowd
Fear and Trembling
For Whom the Bell Tolls
For a Breath I Tarry
Frequent Hearses
From Here to Eternity
Gone with the Wind
Great Work of Time
Have His Carcase
His Dark Materials
How Sleep the Brave
I Know Why the Caged Bird Sings
I Sing the Body Electric
I Will Fear No Evil
If I Forget Thee Jerusalem
If Not Now, When?
In Death Ground
In Dubious Battle
In a Dry Season
In a Glass Darkly
It's a Battlefield
Jacob Have I Loved
Jesting Pilate
Let Us Now Praise Famous Men
Lilies of the Field
Little Hands Clapping
Look Homeward, Angel
Look to Windward
Many Waters
Moab Is My Washpot
Mother Night
Mr Standfast
Nectar in a Sieve
Nine Coaches Waiting
No Country for Old Men
No Highway
No Longer at Ease
Noli Me Tangere
Now Sleeps the Crimson Petal
Number the Stars
O Jerusalem!
O Pioneers!
Of Human Bondage
Of Mice and Men
Oh! To be in England
Pale Kings and Princes
Paths of Glory
Postern of Fate
Precious Bane
Quo Vadis
Recalled to Life
Recalled to Life
Ring of Bright Water
Shall not Perish
Some Buried Caesar
Specimen Days
Stranger in a Strange Land
Such, Such Were the Joys
Surprised by Joy
Taming a Sea Horse
Tender Is the Night
Terrible Swift Sword
That Good Night
That Hideous Strength
The Alien Corn
The Children of Men
The Cricket on the Hearth
The Curious Incident of the Dog in the Night-Time
The Daffodil Sky
The Doors of Perception
The Far-Distant Oxus
The Glory and the Dream
The Golden Apples of the Sun
The Golden Bowl
The Grapes of Wrath
The Green Bay Tree
The Heart Is Deceitful Above All Things
The Heart Is a Lonely Hunter
The House of Mirth
The Last Enemy
The Last Temptation
The Lathe of Heaven
The Line of Beauty
The Little Foxes
The Man Within
The Mermaids Singing
The Millstone
The Mirror Crack'd from Side to Side
The Monkey's Raincoat
The Moon by Night
The Moving Finger
The Moving Toyshop
The Needle's Eye
The Other Side of Silence
The Painted Veil
The Parliament of Man
The Proper Study
The Road Less Traveled
The Skull Beneath the Skin
The Soldier's Art
The Stars My Destination
The Stars' Tennis Balls
The Sun Also Rises
The Torment of Others
The Violent Bear It Away
The Waste Land
The Way Through the Woods
The Way of All Flesh
The Wealth of Nations
The Widening Gyre
The Wind's Twelve Quarters
The Wings of the Dove
The Wives of Bath
The World, the Flesh and the Devil
The Yellow Meads of Asphodel
Things Fall Apart
This Lime Tree Bower
This Side of Paradise
Those Barren Leaves
Thrones, Dominations
Tiger! Tiger!
Time To Murder And Create
Time of our Darkness
Tirra Lirra by the River
To Sail Beyond the Sunset
To Say Nothing of the Dog
To Your Scattered Bodies Go
To a God Unknown
Unweaving the Rainbow
Vanity Fair
Vile Bodies
Waiting for the Barbarians
What's Become of Waring
When the Green Woods Laugh
Where Angels Fear to Tread
Wildfire at Midnight
