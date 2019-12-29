class Logo < React::Component::Base
  render do
    svg xmlns: "http://www.w3.org/2000/svg", width: props.size, height: props.size, viewBox: "0 0 602.56 602.56" do
      circle cx: "300.7", cy: "300.56", r: "252", fill: "#07adb8"
      ellipse cx: ".106", cy: "424.667", rx: "252", ry: "192.35", transform: "rotate(-45)", fill: "#3d3d36"
      circle cx: "300.35", cy: "300.21", r: "192.35", fill: "#f9f292"
      path fill: "#0b6066", d: <<~PATH
        M284.937
        444.221c-8.322-.585-17.24-2.014-25.806-4.135-10.343-2.561-18.937-5.762-28.914-10.77-13.098-6.574-24.505-14.61-34.56-24.342l-3.68-3.562
        7.518-7.54c4.134-4.148 7.666-7.541 7.849-7.541.182 0 1.263.948 2.402 2.108 13.778 14.024 34.322 25.568 54.551 30.653 6.6 1.658 17.034 3.399
        20.38 3.399h1.22V156.64l5.36-.246c10.048-.46 24.32.6 34.96 2.597 26.023 4.883 50.295 17.14 70.107 35.407 3.471 3.2 10.06 10.179 11.353
        12.025.38.542-.288 1.3-7.258 8.253l-7.675 
        7.656-.651-.8c-15.477-19.022-38.477-33.604-62.516-39.636-6.882-1.727-17.856-3.563-21.292-3.563h-.948v26.228l.88.195c13.465 2.994 27.727 8.51
        39.6 15.318 7.99 4.581 18.748 12.39 24.64 17.884l2.24 2.089-15.142
        15.186-3.442-2.972c-13.115-11.323-28.401-19.673-44.907-24.533-2.009-.592-3.7-1.075-3.76-1.075-.06 0-.109 48.94-.109
        108.76v108.76l-1.484.203c-2.008.275-16.348.175-20.915-.147z
      PATH
    end
  end
end
