import Image from 'next/image';

export default function Home() {
  let random = Math.random() * 100;
  let randomHi = 'Hello';
  if (random > 12 && random < 25) {
    randomHi = 'Hi';
  } else if (random < 50) {
    randomHi = 'Hey';
  } else if (random < 75) {
    randomHi = 'Greetings';
  } else if (random < 90) {
    randomHi = 'Salutations';
  }
  return (
    <p className="flex min-h-screen items-center justify-center bg-zinc-50 font-sans dark:bg-black">
      {randomHi}
    </p>
  );
}
