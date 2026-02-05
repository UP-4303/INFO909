using Godot;
using System;

public partial class Character : CharacterBody2D
{
	[Export]
	private float Speed = 300.0f;

	[Export]
	private float JumpVelocity = -400.0f;

	public override void _PhysicsProcess(double delta)
	{
		Vector2 velocity = Velocity;

		if (!IsOnFloor())
		{
			velocity += GetGravity() * (float)delta;
		}

		if (Input.IsActionJustPressed("jump") && IsOnFloor())
		{
			velocity.Y = JumpVelocity;
		}

		float direction = Input.GetActionRawStrength("right") - Input.GetActionRawStrength("left");
		if (direction != 0)
		{
			velocity.X = direction * Speed;
		}
		else
		{
			velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
		}

		Velocity = velocity;
		MoveAndSlide();
	}
}
