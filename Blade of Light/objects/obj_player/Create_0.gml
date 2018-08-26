/// Set Variables

// Movement

hsp = 0;
vsp = 0;
acc = 0.5;
dashsp = 20;
walksp = 4.5;
walkspMax = 4.5;
restrict = 0;
dashing = 0;

// Attacking

canCharge = 1;
charging = 0;
chargeLevel = 0;
chargeLevelMax = 2;
chargePer = 0;

attacking = 0;
// 1 = slash, 2 = whirl, 3 = venera summon

// Control

hurt = 0;
dead = 0;
invul = 0;
knockback = 0;
hpMax = 5;
hp = hpMax;

// Visual

image_speed = 1.3
drawWidth = 1;
facing = 1;

// Knockback is set to 1 when the player is hit; it means the player
//cannot attack for a brief period, and does not naturally stop

// create display
// I assume in every ingame level there will be need for the camera
instance_create_depth(0, 0, -1000000000, ctrl_display);
