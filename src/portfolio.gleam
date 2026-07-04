import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn header() -> Element(message) {
  html.header([
    attribute.class("h-20 pl-8 py-8 pr-12 flex bg-gray-100 items-center rounded-b-lg")
  ], [
    html.h1([attribute.class("text-4xl font-semibold text-black align-middle")], [
      html.text("Alexander Williams")
    ]),
    html.div([attribute.class("flex-grow")], []),
    html.a([
      attribute.href("https://www.linkedin.com/in/alexander-williams-01153319b"),
      attribute.class("text-2xl px-4")
      ], [
      html.text("LinkedIn")
    ]),
    html.a([
      attribute.href("https://github.com/awilli70"),
      attribute.class("text-2xl")
      ], [
      html.text("GitHub")
    ])
  ])
}

pub fn body() -> Element(message) {
  let about = element.fragment([
    html.p([], [
      html.text("Hi, I'm Alex! I'm a software engineer in Boston with a strong interest in system's level programming in C and other low level languages. "),
      html.text("I'm currently working at "),
      html.a([
        attribute.href("https://hyannisportresearch.com"),
        attribute.class("text-blue-500")
      ], [
        html.text("HPR")
      ]),
      html.text(", supporting low-latency pre-trade risk solutions across global markets. "),
      html.text("Outside of work you can find me playing volleyball or running along the Charles!")
    ])
  ])

  let hpr = element.fragment([
    html.h2([attribute.class("text-2xl mt-2")], [
      html.text("Hyannis Port Research - Software Engineer II (2022 - present)")
    ]),
    html.ul([attribute.class("list-disc ml-6 mt-1")],[
      html.li([], [html.text("Designed and implemented client requirements for Softbot, a market gateway and multithreaded pre-trade risk control application written in C.")]),
      html.li([], [html.text("Upgraded core Softbot infrastructure for increased reliability and a 20% reduction in new order latency.")]),
      html.li([], [html.text("Introduced a backwards and forwards compatible system for application recovery, introduced for Softbot and adopted by other teams.")]),
      html.li([], [html.text("Created developer tooling and an improved API used company wide for our proprietary test harness.")]),
      html.li([], [html.text("Architected a standalone market simulation tool used for latency testing and pre-release qualification.")]),
    ])
  ])

  let side_projects = html.ul([attribute.class("list-disc ml-6 mt-1")], [
    html.li([], [
      html.a([attribute.href("https://awilli70.github.io/n-queens-vis/"),
              attribute.class("text-blue-500")], [html.text("N-Queens Visualization")]),
      html.text(", a learning aid I put together for the Tufts CS 105 continuation passing style recitation. "),
      html.text("As a small easter egg, the N-Queens function is also callable via the console to illustrate how different lambdas could be passed in as continuations!"),
    ]),
    html.li([], [
      html.a([attribute.href("https://github.com/awilli70/imposter"),
              attribute.class("text-blue-500")], [html.text("Imposter")]),
      html.text(", a website for automatically generating assignments for a weekend-long mafia game held on an HPR camping trip. "),
      html.text("It's no longer live, but was a fun exercise in stitching together React + Go using websockets."),
    ]),
    html.li([], [
      html.a([attribute.href("https://github.com/awilli70/nix-desktop"),
              attribute.class("text-blue-500")], [html.text("NixOS! ")]),
      html.text("After having a little bit of distro hopping on my personal computer, I finally landed on NixOS. "),
      html.text("At home, I really value having software *just work*, and NixOS was a great way to have stability and reproducibility."),
    ]),
  ])

  html.body([
    attribute.class("mx-8 mt-4 flex-col")
  ], [
    html.h1([attribute.class("text-3xl")], [
      html.text("About")
    ]),
    about,
    html.h1([attribute.class("text-3xl mt-4")], [
      html.text("Work Experience")
    ]),
    hpr,
    html.h1([attribute.class("text-3xl mt-4")], [
      html.text("Side Projects")
    ]),
    side_projects,
  ])
}

pub fn website() -> Element(message) {
  element.fragment([
    header(),
    body()
  ])
}

pub fn main() -> Nil {
  let app = lustre.element(website())
  let assert Ok(_) = lustre.start(app, "#app", Nil)
 
  Nil
}
