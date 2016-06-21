require 'erb'

lipsum_wanted = ARGV
if lipsum_wanted == nil
  lipsum_wanted = [empty,1]
else
  puts lipsum_wanted
end
type = lipsum_wanted[0]
para = lipsum_wanted[1]
para = para.to_i
if para<1
  para=1
  puts "Number of paragraphs not specified defaulting to 1. Attempting to generate #{type} text with single paragraph."
  puts lipsum_wanted
else
  puts "Attempting to generate #{type} text with #{para} paragraph(s)."
end


if type == "bacon"
  title = "Bacon Lorem"
  content = "Frankfurter ribeye biltong meatball. Pork loin tail sausage rump short loin ham hock. T-bone brisket shankle kielbasa fatback. Chuck rump tail shoulder pig andouille ribeye beef cupim short loin salami brisket. Picanha sausage cow tail hamburger fatback. Meatloaf sirloin doner ground round. Ham hock porchetta t-bone shank turducken drumstick pastrami cupim tail salami pork loin filet mignon sausage pork chop. <br><br>" * para
elsif type == "hipster"
  title = "Hipster Lorem"
  content = "Next level listicle letterpress, mustache ennui hammock before they sold out freegan photo booth polaroid kinfolk vinyl offal cornhole. Pinterest keytar paleo, vegan lumbersexual mustache bespoke YOLO shoreditch salvia everyday carry biodiesel chambray iPhone. Truffaut fingerstache polaroid, vice semiotics wayfarers deep v lo-fi kitsch swag tumblr banh mi portland. Cronut hella pickled, selvage yr gochujang twee intelligentsia bespoke mumblecore gastropub. Venmo tumblr banh mi paleo tote bag literally. Squid master cleanse cray pop-up pabst, letterpress helvetica marfa retro direct trade yr photo booth cold-pressed. Roof party VHS fingerstache trust fund, mumblecore YOLO umami scenester chambray. <br><br>" * para
elsif type == "jackson"
  title = "SLJ Lorem"
  content = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass. <br><br>" * para
else
  puts "Please enter a lipsum type: bacon/hipster/jackson and a number of paragraphs (optional, default 1)"
  type = "empty"
  title = "empty"
  content = "User needs to re-run with proper input arguments."
end

new_file = File.open("./#{type}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
