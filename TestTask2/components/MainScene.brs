' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
m.filmLabelList = m.top.findNode("filmLabelList")
m.titleLabel = m.top.findNode("titleLabel")
m.imageFilt = m.top.findNode("imageFilm")
m.descriptionLabel = m.top.findNode("descriptionLabel")

m.content = createObject("RoSGNode","ContentNode")
addData()

m.top.SetFocus(true)
End sub

  sub addData()
    addItem("Legend", "The film is based on the life story of the legendary twin brothers Ronald and Reginald Cray - British gangsters who took control of most of the criminal gangs in London's East End in the 60s of the last century. Having organized a group called The Firm, with the help of which a variety of crimes, ranging from racketeering, robbery and arson, to armed attacks and brutal murders, were committed, the brothers achieved incredible success over several years and were rightfully called the kings of the underworld", "pkg:/images/kisspng-tom-hardy-legend-kray-twins-handsome-bob-the-rise-colin-firth-kingsman-5b5b5c4ed27382.561940111532714062862.png")
    addItem("Transformers", "Fantastic action movie directed by Michael Bay based on the eponymous series about robots.The film tells about the confrontation between two clans of alien robots, the confrontation of which was transferred from their home planet Cybertron to planet Earth. The goal of the Autobots and Decepticons is the key that will lead to the source of endless energy that gives life to these robots, and whoever gets to it first will prevail in this long and brutal war.", "pkg:/images/kisspng-optimus-prime-bumblebee-transformers-the-game-ult-bumblebee-5acbf44aa08738.7951069415233157866575.png")
    addItem("Carrier 3", "Frank Martin stopped working as a carrier, and does not give up trying to start a quiet life. But every time he tries to do this, some problems overtake him.This time it all starts with the fact that a former special forces soldier, like himself, turns to Frank and tells about the abduction of a young girl named Valentina, who is the daughter of the Ukrainian Minister of Environmental Protection. According to him, in this way, the criminals want to put pressure on the Ukrainian official, and force him to give the go-ahead for the disposal of hazardous waste in the country, owned by a large corporation Ecocorp.", "pkg:/images/kisspng-the-transporter-film-series-film-director-action-f-action-movie-5b16a1d0c91ef9.6848688415282098728238.png")
    addItem("Alcatraz", "The unusual plot of the series Alcatraz will acquaint the viewer with the famous American prison, in which a mysterious disappearance occurred many years ago under strange circumstances. This prison was built for the most dangerous criminals. Prison Alcatraz is located on the island and is guarded by real professionals, so it is impossible to escape from it. However, many years ago, when the prison was still in operation, guards and prisoners mysteriously disappeared from it. In 1963, the most secure and secure prison had to be closed.", "pkg:/images/kisspng-escape-from-alcatraz-alcatraz-island-film-prison-d-alcatraz-5b359fe8e17321.6846530615302410009235.png")
    
    film = m.content.getChild(0)
    m.filmLabelList.content = m.content
    m.descriptionLabel.text = film.DESCRIPTION
    m.imageFilt.uri = film.HDPosterUrl
    m.titleLabel.text = film.title
  end sub

  sub addItem(nameFilm as string, description as string, image as string)
    film = m.content.createChild("ContentNode")
    film.title = nameFilm
    film.description = description
    film.HDPosterUrl = image
  end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
  if press
    if key = "OK"
     film = m.content.getChild(m.filmLabelList.itemFocused)
     m.descriptionLabel.text = film.DESCRIPTION
     m.imageFilt.uri = film.HDPosterUrl
     m.titleLabel.text = film.title
    end if
  end if
    return result 
end function
