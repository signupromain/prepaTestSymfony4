<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Tests\Fixtures\Validation\Article;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Sections;
use App\Entity\Articles;

class PublicController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $rub = $entityManager->getRepository(Sections::class)->findAll();
        $art = $entityManager->getRepository(Article::class)->findAll();
        return $this->render('public/index.html.twig', [
            'sections' => $rub,
            'articles' => $art,
        ]);
    }
}
