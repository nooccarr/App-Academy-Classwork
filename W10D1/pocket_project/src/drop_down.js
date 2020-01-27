
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export const dogLinkCreator =  (pojo) => {
  let result = [];
  const keys = Object.keys(pojo); // => ["Corgi", "Austrilian Sheperd"...]

  keys.forEach((element) => {
    const ele = document.createElement('a');
    ele.innerHTML = element;
    ele.href = pojo[element];

    const li = document.createElement('li');
    li.classList.add("dog-link");
    li.appendChild(ele);
    result.push(li);

  });

  return result;
};

export const attachDogLinks = (doglist) => {
  const dogLinks = dogLinkCreator(doglist);
  const ulDropDown = document.getElementsByClassName("drop-down-dog-list");
  dogLinks.forEach((element)=>{
    ulDropDown[0].appendChild(element);
  });

};

attachDogLinks(dogs);

function handleEnter () {
  // let li = document.getElementsByTagName('li');
  let li = document.querySelectorAll("ul.drop-down-dog-list li");
  // debugger
  // li.classList.remove('dog-link');
  Array.from(li).forEach((ele1)=>{
    ele1.classList.remove("dog-link");
  });
  
}

function handleLeave () {
  let li = document.querySelectorAll("ul.drop-down-dog-list li");
  Array.from(li).forEach((ele2) => {
    ele2.classList.add("dog-link");
  });
}
let tag = document.getElementsByTagName('nav');
tag[0].addEventListener('mouseenter', handleEnter.bind(this));
tag[0].addEventListener('mouseleave', handleLeave.bind(this));