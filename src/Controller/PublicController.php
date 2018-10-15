<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Sections;

class PublicController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $rub = $entityManager->getRepository(Sections::class)->findAll();
        return $this->render('public/index.html.twig', [
            'sections' => $rub,
        ]);
    }
}
