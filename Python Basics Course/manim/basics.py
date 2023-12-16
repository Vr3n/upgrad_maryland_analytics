from manim import *


class Pith(Scene):
    def construct(self):
        # rect = Rectangle(color=WHITE, height=3, width=2.5).to_edge(UL)
        # circ = Circle().to_edge(DOWN)

        # arrow = always_redraw(lambda: Line(start=rect.get_bottom(), end=circ.get_top(), buff=0.25).add_tip())

        # self.play(Create(VGroup(rect, circ, arrow)))
        # self.wait()

        # self.play(rect.animate.to_edge(UR), circ.animate.scale(0.5), run_time=4)
        # self.wait()


        # num = MathTex("ln(2)")
        # box = always_redraw(lambda: SurroundingRectangle(num, color=BLUE, fill_opacity=0.4, fill_color=RED, buff=0.5))

        # name = always_redraw(lambda: Tex("Viren Patel").next_to(box, DOWN, buff=0.25))

        # self.play(Create(VGroup(num, box, name)))
        # self.play(num.animate.shift(RIGHT * 2), run_time = 2)
        # self.wait()


        # k = ValueTracker(3.5)

        # num = always_redraw(lambda: DecimalNumber().set_value(k.get_value()))

        # self.play(FadeIn(num))
        # self.wait()
        # self.play(k.animate.set_value(0), run_time=3, rate_func=smooth)
        # self.wait()


        plane = NumberPlane(x_range=[-4, 4, 2], x_length=7, y_range=[0, 16, 4], y_length=5).to_edge(DOWN).add_coordinates()

        labels = plane.get_axis_labels(x_label="x", y_label="f(x)")
        parabola = plane.plot(lambda x: x ** 2, x_range=[-4, 4], color=ORANGE, )
        func_label = MathTex("f{x}={x}^{2}").scale(0.6).next_to(parabola, RIGHT, buff=0.5).set_color(GREEN)

        area = plane.get_riemann_rectangles(graph=parabola, x_range=[-2, 3], dx=0.2, stroke_width=0.1, stroke_color=WHITE)

        self.play(DrawBorderThenFill(plane))
        self.play(Create(VGroup(labels, parabola, func_label)))
        self.wait()
        self.play(Create(area))
        self.wait()