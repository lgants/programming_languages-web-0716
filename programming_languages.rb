=begin
INPUT
languages = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
    }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }
  }
}

OUTPUT
{
  :ruby => {
    :type => "interpreted",
    :style => [:oo]
  },
  :javascript => {
    :type => "interpreted",
    :style => [:oo, :functional]
  },
  :python => {
    :type => "interpreted",
    :style => [:oo]
  },
  :java => {
    :type => "compiled",
    :style => [:oo]
  },
  :clojure => {
    :type => "compiled",
    :style => [:functional]
  },
  :erlang => {
    :type => "compiled",
    :style => [:functional]
  },
  :scala => {
    :type => "compiled",
    :style => [:functional]
  }
}

=end 
  
def reformat_languages(languages)
  new_hash = {}
  languages.each do |paradigm, language|
    language.each do |language, type|
      type.each do |type, value|
        if language == :javascript
          new_hash[language] = {
            :type => value,
            :style => [:oo, :functional]
          }
        else 
          new_hash[language] = {
            :type => value,
            :style => [paradigm]
          }
        end 
      end
    end  
  end 
  new_hash
end
