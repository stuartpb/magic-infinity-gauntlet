//
// http://paulbourke.net/geometry/superellipse/
//

include <LineRenderer.scad>

scale([10,10,10])
//superellipse(power1=0.2, power2=1, steps=72);
//superellipse(power1=0.2, power2=3, steps=72);
//superellipse(power1=0.5, power2=0.5, steps=36);
//superellipse(power1=0.5, power2=3, steps=100, ysteps=18);
//superellipse(power1=1, power2=2, steps=18);
//superellipse(power1=1, power2=3, steps=36, ysteps=36);
superellipse(power1=2/3, power2=2/3, steps=90, ysteps=90);
//superellipse(power1=3, power2=0.2, steps=18, ysteps=24);
//superellipse(power1=3, power2=1, steps=72);
//superellipse(power1=4, power2=4, steps=36, ysteps=36, wireframe=true);
//superellipse(power1=6, power2=3, steps=36, ysteps=36);


function _EvalSuperEllipse2(p1,p2,ct1,ct2,st1,st2,tmp) = [
	tmp * sign(ct2) *pow(abs(ct2), p2),
	sign(st1) * pow(abs(st1), p1),
	tmp * sign(st2) * pow(abs(st2),p2)];

function _EvalSuperEllipse1(p1,p2, ct1, ct2, st1, st2) = 
	_EvalSuperEllipse2(p1,p2, ct1,ct2,st1,st2, sign(ct1) * pow(abs(ct1),p1));

function EvalSuperEllipse(t1, t2, p1, p2) = 
	_EvalSuperEllipse1(p1, p2, cos(t1),cos(t2),sin(t1),sin(t2));

function CalcNormal(p1,p2,p3) = VCROSS(p1-p2, p3-p2);



module superellipse(power1, power2, steps = 10, ysteps=10, wireframe=false)
{
	radius = 0.065/8;
	PID2 = 180/2;
	stepangle = 360/steps;
	ystepangle = 360/ysteps;

	delta = 0.01*stepangle;

	if (steps < 4)
	{
		sphere(r=1,$fn=12);
	} else if (power1 > 10 && power2 > 10)
	{
		// If the powers are really high, we can just draw a plus
		// sign and not bother with the computation
			PlaceLine([[-1,0,0], [1, 0,0]], radius=0.125);
			PlaceLine([[0,-1,0], [0, 1,0]], radius=0.125);
			PlaceLine([[0,0,-1], [0, 0,1]], radius=0.125);
	} else
	{
		for (j=[0:ysteps/2])
		{
			assign(theta1 = j*ystepangle - PID2)
			assign(theta2 = (j+1)*ystepangle - PID2)

			for (i=[0:steps-1])
			{
				assign(  theta3 =  i*stepangle )
				assign(  theta4 = (i+1)*stepangle )

				assign(v1 = EvalSuperEllipse(theta2, theta3, power1, power2))
				assign(v2 = EvalSuperEllipse(theta2, theta4, power1, power2))
				assign(v3 = EvalSuperEllipse(theta1, theta4, power1, power2))
				assign(v4 = EvalSuperEllipse(theta1, theta3, power1, power2))			
				{
					if (wireframe)
					{
						color([1,1,1])
						PlaceLine([v1, v2], radius=radius);
						color([1,1,1])
						PlaceLine([v2, v3], radius=radius);
						color([1,1,1])
						PlaceLine([v3, v4], radius=radius);
						color([1,1,1])
						PlaceLine([v4, v1], radius=radius);
					}
	
					polyhedron(
						points = [v1,v2,v3,v4],
						triangles = [
							[0,1,2],
							[0,2,3]
						]);

					//color([1,1,1])
					//translate(v1)
					//sphere(r=radius, $fn=12);
	
					//translate(v2)
					//sphere(r=radius, $fn=12);
				}
			}
		}
	}
}
