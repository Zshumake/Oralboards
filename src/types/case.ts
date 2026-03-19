export type Section = {
    title: string;
    content: string;
};

export type Case = {
    id: string;
    title: string;
    url: string;
    sections: Section[];
};
